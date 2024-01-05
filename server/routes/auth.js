const express = require("express");
const Member = require("../models/user");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req,res)=>{

    const { name, email, password, messid } = req.body;

  // Check if all fields are present
  if (!name || !email || !password) {
    return res.status(400).json({ error: 'Name, email, and password are required.' });
  }

  let member = new Member({  // req body theke ja paisi, ta ei variable gulay save chhilo.
    name,
    email,
    password,
    messid
  });
  //variable er data gula ekhn database a save korar palla.
   member = await member.save();

   res.json(member);


  res.status(200).json({ message: 'User created successfully.' });


});

authRouter.post("/api/signin",(req,res)=>{



});




module.exports = authRouter ;