const express = require('express');
const router = express.Router();
const departures = require('../services/departuresService.js');

router.get('/GetAll', async function(req, res, next) {
    try {
        res.json(await departures.getMultiple());
    } catch (err) {
        console.error(`Error mientras se consutaba por los datos: `, err.message);
        next(err);
    }
});

module.exports = router