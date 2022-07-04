import http from "../http-common.js";

class DataService{

    getAllDepartures(){
        return http.get("/Departures/GetAll");
    }
    
    getAllData(){
        return http.get("/Data/GetAll");
    }

    getAllMetric(){
        return http.get("/Metric/GetAll");
    }

}

export default new DataService();