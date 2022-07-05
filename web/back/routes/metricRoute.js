const express = require('express');
const router = express.Router();
const metric = require('../services/metricService.js');

router.get('/GetAll', async function(req, res, next) {
    try {
        res.json(await metric.getMultiple());
    } catch (err) {
        console.error(`Error mientras se consutaba por los datos: `, err.message);
        next(err);
    }
});

module.exports = router