console.log("producer..");
const kafka = require("kafka-node");
const useStaffVersion = false;
const LiveDepartureBoardService = require('ldbs-json');
const token = "61fa113f-d206-4a9b-8d68-5a4a8f0fd79f";

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
    numRows: 100,
    timeWindow: 30,
    timeOffset: 0
    //filterCrs: "WCX",
    //filterType: "to"

}

const api = new LiveDepartureBoardService(token, false);

producer.on("ready", function(){
    setInterval(function(){
        api.call("GetDepartureBoard", optionsGetDepartureBoard)
        .then(board => {
            console.log(board);
            if (Object.keys(board.GetStationBoardResult).includes("trainServices")){
                producer.send([{topic:optionsGetDepartureBoard.crs, messages: JSON.stringify(board.GetStationBoardResult)}], 
                                function (err, data){});
                console.log(board.GetStationBoardResult.trainServices.service);
                
            }
            else{
                console.log("No hay trenes");
            }    
        })
        .catch(error => console.error(error));
    }, 3000);
});
    


    
    
    
