const express = require("express");
const authRouter = require("./routes/auth");
const mydatabase = require("mongoose");
const mealRouter = require("./routes/memberNbot");
const pushBazar = require("./routes/bazar");

const { io, chatserver, chatapp } = require("./routes/chat");

const PORT = 3000;
const DB = "mongodb+srv://managernafi:dmc54321@cluster0.7dvhcpm.mongodb.net/?retryWrites=true&w=majority";


const app = express();


app.use(express.json());
app.use(authRouter);
app.use(mealRouter);
app.use(pushBazar);






mydatabase.connect(DB).then(()=>{
    console.log("Daatabase Connected successfully");
}).catch((e)=>{
    console.log(e);
});

io.attach(chatserver);

const server = app.listen(PORT, ()=>{
    console.log(`Server is running  on ${PORT}`)
});