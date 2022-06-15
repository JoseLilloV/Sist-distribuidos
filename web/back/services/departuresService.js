
const db = require('../db');
  
async function getMultiple() {
    const data = await db.query(
       'SELECT * FROM departures ',
    );
    return data;
}

module.exports = {
    getMultiple 
}