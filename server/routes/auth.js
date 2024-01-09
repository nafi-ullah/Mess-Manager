const express = require("express");
const Member = require("../models/user");
const bcryption = require("bcryptjs");
const jwt = require("jsonwebtoken");
const randomingMessId = require('../generator');
const auth = require("../middlewares/auth");



const authRouter = express.Router();

authRouter.post("/api/signup", async (req,res)=>{

    try{
        const { name, email, password, messid } = req.body;

        // Check if all fields are present
        if (!name || !email || !password) {
          return res.status(400).json({ error: 'Name, email, and password are required.' });
        }

        const hashPass = await bcryption.hash(password, 8);

        if(messid != "noob"){
            const memberCredential = await Member.findOne({ messid });
            if(!memberCredential){
                return res.status(400)
                .json({error: "This mess id is incorrect"});
            }
        }

        let member = new Member({  // req body theke ja paisi, ta ei variable gulay save chhilo.
            name,
            email,
            password: hashPass,
            messid: messid == "noob" ? randomingMessId(6) : messid
          });

        
        //variable er data gula ekhn database a save korar palla.
         member = await member.save();
      
        return res.json(member);
      
      
        //return res.status(200).json({ message: 'User created successfully.' });
      
    }catch(e){
        return res.status(500).json({"error": e.message})
    }

   

});

authRouter.post("/api/signin",async (req,res)=>{
        // collect email pass from body
        // get the all credentials of this user
        // check if it is null or not
        // verfiy the password
        // if  pass match : response a token with user details(token and _doc)

        try{
            const { email, password } = req.body;

            const memberCredential = await Member.findOne({ email }); // Member hocche database er protinidhi, so eta diye database er sob operation kora hobe.
            
            if(!memberCredential){
                return res.status(400)
                .json({error: "This email is not found in database"});
            }

            const isPassMatch = await bcryption.compare(password, memberCredential.password);

            if(!isPassMatch){
                return res.status(400).json({msg: "password invalid"});
            }

            const token = jwt.sign({id: memberCredential._id}, "passwordKey");
                return res.json({token, ...memberCredential._doc});


        }catch(e){
                return res.status(500).json({error: e.message});
        }


});

authRouter.post("/tokenIsValid", async (req, res) => {
    try {
      const token = req.header("x-auth-token");
      if (!token) return res.json(false);
      const verified = jwt.verify(token, "passwordKey");
      if (!verified) return res.json(false);
  
      const user = await Member.findById(verified.id);
      if (!user) return res.json(false);
      res.json(true);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  
  // get user data
  authRouter.get("/", auth, async (req, res) => {
    const member = await Member.findById(req.user);
    res.json({ ...member._doc, token: req.token });
  });


module.exports = authRouter ;