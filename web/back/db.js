const { Pool } = require('pg');
const db = { 
        host:  process.env.DB_ADDR,
        port:   '5432',
        user:  'postgres',
        password: 'postgres',
        database: 'LDBWS2',
    };

const pool = new Pool(db);

async function query(query, params) {
    const {rows, fields} = await pool.query(query, params);
    return rows;
}

module.exports = {
  query
}