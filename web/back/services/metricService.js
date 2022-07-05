
const db = require('../db');
  
async function getMultiple() {
    const data = await db.query(
       'SELECT * FROM metric ',
    );
    return data;
}

module.exports = {
    getMultiple 
}