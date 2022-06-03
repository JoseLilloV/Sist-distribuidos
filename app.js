const useStaffVersion = false;
const LiveDepartureBoardService = require('ldbs-json');
const token = "61fa113f-d206-4a9b-8d68-5a4a8f0fd79f"; // put a valid token here

/**
 * Simple example code for running the user version of the DepartureBoard Info
 * NB: You will need a valid Token to access the SV version of the api
 */
// const settings = require('../settings.json');
// const LiveDepartureBoardService = require('../index');


// Set up the options for the call
const options = {
    crs:"ASN",
    filterList: ["KGX"],
    timeWindow:120,
    timeOffset: 0
};

const api = new LiveDepartureBoardService(token, false);
api.call("GetNextDepartures", options)
    .then(board => {
        console.log(board);
        console.log(board['DeparturesBoard']['departures']);
    })
    .catch(error => console.error(error));


