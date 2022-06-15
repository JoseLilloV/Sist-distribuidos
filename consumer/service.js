const db = require('../db');
const Client = require("../config");
var async = require('async');


async function createDepartures(generatedAt, locationName, crs, trains){
    await db.pool.connect();
    try {
        let query = 'INSERT INTO departures(date, time, location_name, crs, crs_origin, crs_destination, origin, destination, std, etd) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *';
        let date = generatedAt.split("T")[0];
        let time = generatedAt.split("T")[1].split(".")[0];
        if(Object.prototype.toString.call(trains) === '[object Array]') {
            for (const train of trains){
                let values = [date, time, locationName, crs, train.origin.location.crs, 
                    train.destination.location.crs, train.origin.location.locationName, 
                    train.destination.location.locationName, train.std, train.etd];
                await db.pool.query(query, values).then(res => console.log(res.rows));
            }
        }
        else{
            let values = [date, time, locationName, crs, trains.origin.location.crs, 
                trains.destination.location.crs, trains.origin.location.locationName, 
                trains.destination.location.locationName, trains.std, trains.etd];
           await db.pool.query(query, values);

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

module.exports={createDepartures};