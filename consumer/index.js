const service = require("./service");
const kafka = require("kafka-node");
/*
const start_get = async function(a, b) {
    const result = await service.getDeparturesByDay();
    console.log(result);
  }
  
  // Call start
start();
*/



const client = new kafka.KafkaClient({
    kafkaHost: process.env.INTERNAL_KAFKA_ADDR
});

var consumer = new kafka.Consumer(client, [{topic: "LST"}]);

const fecha = new Date();
var date = String(fecha.getFullYear())+ '-' + String( fecha.getMonth() + 1) + '-' + String(fecha.getDate());
console.log("CONSUMER UP db=(", process.env.DB_ADDR, ") kafka=(", process.env.INTERNAL_KAFKA_ADDR, ")");
consumer.on("message", async function (message){
    console.log(message);
    let parsedMessage = JSON.parse(message.value);
        await service.createDepartures(parsedMessage.generatedAt, 
            parsedMessage.locationName, parsedMessage.crs, 
            parsedMessage.trainServices.service);
        await service.createDataRaw(parsedMessage);
    let date_now = String(fecha.getFullYear())+ '-' + String( fecha.getMonth() + 1) + '-' + String(fecha.getDate());
    if ( date != date_now){
        const result = await service.getDeparturesByDay();
        await service.createMetrics(result);
        date = date_now
    }
});

