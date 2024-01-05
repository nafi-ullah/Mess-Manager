const express = require("express");

const authRouter = express.Router();

authRouter.post("/api/signup",(req,res)=>{

    const { name, email, password } = req.body;

  // Check if all fields are present
  if (!name || !email || !password) {
    return res.status(400).json({ error: 'Name, email, and password are required.' });
  }

  // Your logic to save the user or perform actions with the data
  // For simplicity, let's just send a success message
  res.status(200).json({ message: 'User created successfully.' });


});

authRouter.post("/api/signin",(req,res)=>{



});




module.exports = authRouter ;