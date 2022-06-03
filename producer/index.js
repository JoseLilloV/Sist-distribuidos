console.log("producer..");
const kafka = require("kafka-node");

const client = new kafka.KafkaClient({kafkaHost: "127.0.0.1:9092"});

var producer = new kafka.Producer(client);

producer.on("ready", function (){
    setInterval(function(){
        producer.send([{topic:"test", messages: "Hola"}], function (err, data){});
    }, 5000);
})