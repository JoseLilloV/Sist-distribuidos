const service = require("./service");
const kafka = require("kafka-node");
var async = require('async');
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
let month = fecha.getMonth() + 1;
let day = fecha.getDate();
let month_string = String(month);
let day_string = String(day);
if (month<10){
    month_string = "0" + String(month);
}
if (day<10){
    day_string = "0" + String(day);
}

var date = String(fecha.getFullYear())+ '-' + month_string + '-' + day_string;
console.log("CONSUMER UP", date);

consumer.on("message", async function (message){
    console.log(message);
    await service.createDataRaw(message);
    let parsedMessage = JSON.parse(message.value);
        await service.createDepartures(parsedMessage.generatedAt, 
            parsedMessage.locationName, parsedMessage.crs, 
            parsedMessage.trainServices.service);

    let month_now = fecha.getMonth() + 1;
    let day_now = fecha.getDate();
    let month_now_string = String(month_now);
    let day_now_string = String(day_now);
    if (month_now<10){
        month_now_string = "0" + String(month_now);
    }
    if (day_now<10){
        day_now_string = "0" + String(day_now);
    }
    let date_now = String(fecha.getFullYear())+ '-' + month_now + '-' + day_now;
    if ( date != date_now){
        await service.getDeparturesByDay(date);
        date = date_now;
    }
});

