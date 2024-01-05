const express = require("express");


const PORT = 3000;

const app = express();


const server = app.listen(PORT, ()=>{
    console.log(`Server is running on ${PORT}`)
});