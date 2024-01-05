const express = require("express");

const authRouter = express.Router();

authRouter.get("/myapi", (req,res)=>{
    res.json({
        hi: "This is insane"
    });
});


module.exports = authRouter ;