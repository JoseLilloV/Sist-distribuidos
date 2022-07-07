const db = require('../db');
const Client = require("../config");
var async = require('async');


async function createDepartures(generatedAt, locationName, crs, trains){
    
    try {
        let query = 'INSERT INTO departures(date, time, location_name, crs, crs_origin, crs_destination, origin, destination, std, etd) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *';
        let date = generatedAt.split("T")[0];
        let time = generatedAt.split("T")[1].split(".")[0];
        if(Object.prototype.toString.call(trains) === '[object Array]') {
            for (const train of trains){
                let values = [date, time, locationName, crs, train.origin.location.crs, 
                    train.destination.location.crs, train.origin.location.locationName, 
                    train.destination.location.locationName, train.std, train.etd];
                let client = await db.pool.connect();
                await client.query(query, values).then(res => {console.log(res.rows);client.release()});
            }
        }
        else{
            let values = [date, time, locationName, crs, trains.origin.location.crs, 
                trains.destination.location.crs, trains.origin.location.locationName, 
                trains.destination.location.locationName, trains.std, trains.etd];
           let client = await db.pool.connect();
           await client.query(query, values).then(res => {console.log(res.rows);client.release()});
        }
        
    } 
    catch (e) {
        await db.pool.query("ROLLBACK");
        console.log("Error consumer service");
        throw e;
    } 
    finally {
        console.log("Consumer service done")
    }
       
}

async function getDeparturesByDay(date){
  
    try {
        let query = 'SELECT * FROM departures WHERE date = $1';
        const fecha = new Date();
        //let date = "2022-06-13"
        let client = await db.pool.connect();
        await client.query(query, [date]).then(res => {client.release();console.log(res.rows);return createMetrics(res.rows)});
    } 
    catch (e) {
        console.log("Error al consultar por los trenes del dia: ", new Date());
        throw e;
    } 
       
}

async function createMetrics(listOfDepartures){
    try {        
        let insert_query = 'INSERT INTO metric (date, percentage_ontime, quantity_train_to_pad, quantity_train_to_abw, quantity_train_to_snf )  VALUES ($1, $2, $3, $4, $5) RETURNING *';
        let update_query = 'UPDATE metric SET percentage_ontime = $2, quantity_train_to_pad = $3, quantity_train_to_abw = $4, quantity_train_to_snf = $5 WHERE date = $1;'
        let percentage_ontime = 0
        let quantity_train_to_pad = 0
        let quantity_train_to_abw = 0
        let quantity_train_to_snf = 0
        let date = listOfDepartures[0].date
        for (let index = 0; index < listOfDepartures.length; index++) {
            if (listOfDepartures[index].etd == "On time")
                percentage_ontime = percentage_ontime + 1;
            let dest = listOfDepartures[index].crs_destination;
            if (dest=='PAD'){
                quantity_train_to_pad = quantity_train_to_pad + 1;
            }
            else if (dest=='ABW'){
                quantity_train_to_abw = quantity_train_to_abw + 1;
            }
            else if (dest=='SNF'){
                quantity_train_to_snf = quantity_train_to_snf + 1
            }
        }
        percentage_ontime = percentage_ontime/listOfDepartures.length * 100;
        let client = await db.pool.connect();
        await client.query(insert_query, [date, Math.floor(percentage_ontime), quantity_train_to_pad, quantity_train_to_abw, quantity_train_to_snf])
            .then(res => {client.release();return res.rows;});
    } 
    catch (e) {
        console.log("Error al consultar por los trenes del dia");
        throw e;
    } 

}

async function createDataRaw(value){
    
    try {
        let query = 'INSERT INTO data (value) VALUES ($1) RETURNING *';
        let client = await db.pool.connect();
        await client.query(query, [value]).then(res => {client.release()});
    } 
    catch (e) {
        await db.pool.query("ROLLBACK");
        console.log("Error consumer service");
        throw e;
    } 
    finally {
        console.log("Consumer service done")
    }
       
}

module.exports={createDepartures, getDeparturesByDay, createMetrics, createDataRaw };