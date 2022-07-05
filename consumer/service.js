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

async function getDeparturesByDay(){
    await db.pool.connect();
    try {
        let query = 'SELECT * FROM departures WHERE date = $1';
        const fecha = new Date();
        //let date = "2022-06-13"
        let date = String(fecha.getFullYear())+ '-' + String( fecha.getMonth() + 1) + '-' + String(fecha.getDate()-1);
        data = await db.pool.query(query, [date])
        return data.rows;
    } 
    catch (e) {
        console.log("Error al consultar por los trenes del dia: ", new Date());
        throw e;
    } 
       
}

async function createMetrics(listOfDepartures){
    await db.pool.connect();
    try {        
        let insert_query = 'INSERT metric (date, percentage_ontime, quantity_train_to_pad, quantity_train_to_abw, quantity_train_to_snf )  VALUES ($1, $2, $3, $3, $4) RETURNING *';
        let update_query = 'UPDATE metric SET percentage_ontime = $2, quantity_train_to_pad = $3, quantity_train_to_abw = $4, quantity_train_to_snf = $5 WHERE date = $1;'
        let percentage_ontime = 0
        let quantity_train_to_pad = 0
        let quantity_train_to_abw = 0
        let quantity_train_to_snf = 0
        let date = listOfDepartures[0].date
        for (let index = 0; index < listOfDepartures.length; index++) {
            if (listOfDepartures[index].etd == "On time")
                percentage_ontime = percentage_ontime + 1
            switch (listOfDepartures[0].crs_destination) {
                case 'PAD':
                    quantity_train_to_pad = quantity_train_to_pad + 1
                    break;
                case 'ABW':
                    quantity_train_to_abw = quantity_train_to_abw + 1
                    break
                case 'SNF':
                    quantity_train_to_snf = quantity_train_to_snf + 1
                    break
            }
        }
        percentage_ontime = percentage_ontime/listOfDepartures.length * 100
        data = await db.pool.query(insert_query, [date, percentage_ontime, quantity_train_to_pad, quantity_train_to_abw, quantity_train_to_snf])
        return data;
    } 
    catch (e) {
        console.log("Error al consultar por los trenes del dia: ", date);
        throw e;
    } 

}

module.exports={createDepartures, getDeparturesByDay, createMetrics };