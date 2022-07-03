const service = require("./service");

console.log("consumer..");
const kafka = require("kafka-node");
/*
const start_get = async function(a, b) {
    const result = await service.getDeparturesByDay();
    console.log(result);
  }
  
  // Call start
start();
*/

const client = new kafka.KafkaClient({kafkaHost: "127.0.0.1:9092"});

var consumer = new kafka.Consumer(client, [{topic: "LST"}]);

const fecha = new Date();
var date = str(fecha.getFullYear())+ '-' + str( fecha.getMonth() + 1) + '-' + str(fecha.getDate());

consumer.on("message", async function (message){
    console.log(message);
    let parsedMessage = JSON.parse(message.value);
        await service.createDepartures(parsedMessage.generatedAt, 
            parsedMessage.locationName, parsedMessage.crs, 
            parsedMessage.trainServices.service);
    let date_now = str(fecha.getFullYear())+ '-' + str( fecha.getMonth() + 1) + '-' + str(fecha.getDate());
    if ( date != date_now){
        const result = await service.getDeparturesByDay();
        await service.createMetrics(result);
        date = date_now
    }
});

