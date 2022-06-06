console.log("producer..");
const kafka = require("kafka-node");
const useStaffVersion = false;
const LiveDepartureBoardService = require('ldbs-json');
const token = "61fa113f-d206-4a9b-8d68-5a4a8f0fd79f"; // put a valid token here

const client = new kafka.KafkaClient({kafkaHost: "127.0.0.1:9092"});

var producer = new kafka.Producer(client);

const options = {
    crs:"NUM",
    filterList: ["MUF", "LIV", "WCX", "HFE"],
    timeWindow: 120,
    timeOffset: 0
};

const optionsGetDepartureBoard = {
    crs: "LST",
    numRows: 20,
    timeWindow: 10,
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
        console.log(board);
        if (Object.keys(board.GetStationBoardResult).includes("trainServices")){
            producer.send([{topic:"LST", messages: JSON.stringify(board.GetStationBoardResult)}], 
                            function (err, data){});
            console.log(board.GetStationBoardResult);
            console.log(board.GetStationBoardResult.trainServices.service);
            
        }
        else{
            console.log("No hay trenes");
        }
        
        
        
    })
    .catch(error => console.error(error));
    
    // setInterval(function(){
    //     producer.send([{topic:"test2", messages: "Hola"}], function (err, data){});
    // }, 5000);
    
