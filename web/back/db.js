const { Pool } = require('pg');
const db = { 
        host:  'localhost',
        port:   '5432',
        user:  'postgres',
        password: 'A1b1c3Z0',
        database: 'LDBWS',
    };

const pool = new Pool(db);

async function query(query, params) {
    const {rows, fields} = await pool.query(query, params);
    return rows;
}

module.exports = {
  query
}