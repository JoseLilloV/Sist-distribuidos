const express = require('express');
const router = express.Router();
const data = require('../services/dataService.js');

router.get('/GetAll', async function(req, res, next) {
    try {
        res.json(await data.getMultiple());
    } catch (err) {
        console.error(`Error mientras se consutaba por los datos: `, err.message);
        next(err);
    }
});

module.exports = router