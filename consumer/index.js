const service = require("./service");

console.log("consumer..");
const kafka = require("kafka-node");

const client = new kafka.KafkaClient({kafkaHost: "127.0.0.1:9092"});

var consumer = new kafka.Consumer(client, [{topic: "LST"}]);

consumer.on("message", function (message){
    console.log(message);
    let result = service.create2(message);
    console.log(result);
});

