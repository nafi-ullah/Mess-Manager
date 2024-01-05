const express = require("express");
const authRouter = require("./routes/auth");

const PORT = 3000;

const app = express();


app.use(authRouter);


const server = app.listen(PORT, ()=>{
    console.log(`Server is running  on ${PORT}`)
});