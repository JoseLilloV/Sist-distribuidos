
const db = require('../db');
  
async function getMultiple() {
    const data = await db.query(
       'SELECT * FROM data ',
    );
    return data;
}

module.exports = {
    getMultiple 
}