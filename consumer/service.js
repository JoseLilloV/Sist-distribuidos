const db = require('../db');
const Client = require("../config");

async function create(data) {
    Client.client.connect();
    Client.client.query('INSERT INTO data(value) VALUES ($1) RETURNING *',
    [data.value]
    ).then(response => {

        console.log(response.rows)

        Client.client.end()

    })

    .catch(err => {

        Client.client.end()

    })
}

async function createDepartures(locationName, crs, trains){
    Client.client.connect();
    let query = 'INSERT INTO departures(location_name, crs, crs_origin, crs_destination, origin, destination, std, etd) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *';
    for (let train of trains){
        let values = [locationName, crs, train.origin.location.crs, train.destination.location.crs, train.origin.location.locationName, train.destination.location.locationName, train.std, train.etd];
        Client.client.query(query, values, function(err, result){
            
            if (err){
                Client.client.end();
                return "error";
            }
            
        });
    }
    return "ok";
}

module.exports={create, createDepartures};