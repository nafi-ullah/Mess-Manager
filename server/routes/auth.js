const express = require("express");
const Member = require("../models/user");
const bcryption = require("bcryptjs");


const authRouter = express.Router();

authRouter.post("/api/signup", async (req,res)=>{

    try{
        const { name, email, password, messid } = req.body;

        // Check if all fields are present
        if (!name || !email || !password) {
          return res.status(400).json({ error: 'Name, email, and password are required.' });
        }

        const hashPass = await bcryption.hash(password, 8);

      
        let member = new Member({  // req body theke ja paisi, ta ei variable gulay save chhilo.
          name,
          email,
          password: hashPass,
          messid
        });
        //variable er data gula ekhn database a save korar palla.
         member = await member.save();
      
        return res.json(member);
      
      
        return res.status(200).json({ message: 'User created successfully.' });
      
    }catch(e){
        return res.status(500).json({"error": e.message})
    }

   

});

authRouter.post("/api/signin",(req,res)=>{



});




module.exports = authRouter ;