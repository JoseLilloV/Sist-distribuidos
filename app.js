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
    crs:"NUM",
    filterList: ["MUF", "LIV", "WCX", "HFE"],
    timeWindow: 120,
    timeOffset: 0
};

const optionsGetDepartureBoard = {
    crs: "LST",
    numRows: 10,
    timeWindow: 5,
    timeOffset: 0
    //filterCrs: "WCX",
    //filterType: "to"

}

let depBoard = Array();

const api = new LiveDepartureBoardService(token, false);
// api.call("GetFastestDepartures", options)
//     .then(board => {
//         console.log(board);
//         console.log(board['DeparturesBoard']['departures']["destination"]);
//     })
//     .catch(error => console.error(error));

api.call("GetDepartureBoard", optionsGetDepartureBoard)
    .then(board => {
        //console.log(board.GetStationBoardResult.trainServices);
        for (let i of board.GetStationBoardResult.trainServices.service){
            depBoard.push(i);
        }
        for (let i of depBoard){
            console.log(i);
            console.log("origen: ", i.origin.location.locationName);
            console.log("destino: ", i.destination.location.locationName);
        }
        
    })
    .catch(error => console.error(error));


