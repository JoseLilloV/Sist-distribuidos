const db = require('../db');
const Client = require("../config");

async function create(data) {
    //validateCreate(ra);
    const result = await db.query(
        'INSERT INTO data(value) VALUES ($1) RETURNING *',
        [data.value]
    );
    let message = 'Error al crear el registro';
    if (result.length) {
        message = 'Registro creado satisfactoriamente';
    }
    return {message};
}

function create2(data){
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

module.exports={create, create2};