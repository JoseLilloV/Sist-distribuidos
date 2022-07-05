import axios from "axios";

export default axios.create({
  baseURL: "http://20.226.10.158:5000/",
  headers: {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "GET, POST, PATCH, PUT, DELETE, OPTIONS",
  }
});