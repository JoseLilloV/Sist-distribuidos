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
            producer.send([{topic:"LST", messages: JSON.stringify(i)}], 
                            function (err, data){});
        }
        
        
    })
    .catch(error => console.error(error));




    // setInterval(function(){
    //     producer.send([{topic:"test2", messages: "Hola"}], function (err, data){});
    // }, 5000);
    
