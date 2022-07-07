const { Pool } = require('pg');
const config = {
  db: { 
    host:  process.env.DB_ADDR,
    port:   '5432',
    user:  'postgres',
    password: 'postgres',
    database: 'LDBWS2',
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