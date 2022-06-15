const { Pool } = require('pg');
const config = {
  db: { 
    host:  'localhost',
    port:   '5432',
    user:  'postgres',
    password: 'postgres',
    database: 'LDBWS',
  },
};
const pool = new Pool(config.db);

async function query(query, params) {
    const {rows, fields} = await pool.query(query, params);
    return rows;
}

module.exports = {
  pool
}