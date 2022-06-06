const service = require("./service");

console.log("consumer..");
const kafka = require("kafka-node");

const client = new kafka.KafkaClient({kafkaHost: "127.0.0.1:9092"});

var consumer = new kafka.Consumer(client, [{topic: "LST"}]);

consumer.on("message", async function (message){
    console.log(message);
    let parsedMessage = JSON.parse(message.value);
        const response = await service.createDepartures(parsedMessage.locationName, parsedMessage.crs, parsedMessage.trainServices.service).catch((err) => console.log("error"));
        console.log(response);
});

