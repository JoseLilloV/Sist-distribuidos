
const db = require('../db');
  
async function getMultiple() {
    const data = await db.query(
       'SELECT * FROM metric ORDER BY id',
    );
    return data;
}

module.exports = {
    getMultiple 
}