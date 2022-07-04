const { Client } = require('pg')

const config = {
    db: { 
      host:  'localhost',
      port:   '5432',
      user:  'postgres',
      password: 'postgres',
      database: 'LDBWS2',
    },
  };
  
const client = new Client(config.db);
module.exports = {client};