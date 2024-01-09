const express = require("express");
const MealInfo = require("../models/mealInfo");




const mealRouter = express.Router();

mealRouter.post("/api/mealInfo",async (req,res)=>{

    const year = currentDate.getFullYear();
    const month = currentDate.getMonth() + 1; // Note: Months are zero-based, so add 1
    const day = currentDate.getDate();

    const formattedDate = `${year}-${month < 10 ? '0' + month : month}-${day < 10 ? '0' + day : day}`;

    try{
        // ekhane name messID mealMenu mealCount recieve korbo jst,
        // pore seta MealInfo er sathe time onujayi align kore nibo.
        const { name, messid, lunchMeal, lunchCount, lunchComment  } = req.body;

        let pushMeal = new MealInfo({
            name,
            messid,
            lunchMeal,
            lunchCount,
            lunchComment,
            date: formattedDate

        });


    }catch(e){

    }

})

// authRouter.post("/api/signup", async (req,res)=>{

//     try{
//         const { name, email, password, messid } = req.body;

//         // Check if all fields are present
//         if (!name || !email || !password) {
//           return res.status(400).json({ error: 'Name, email, and password are required.' });
//         }

//         const hashPass = await bcryption.hash(password, 8);

//         if(messid != "noob"){
//             const memberCredential = await Member.findOne({ messid });
//             if(!memberCredential){
//                 return res.status(400)
//                 .json({error: "This mess id is incorrect"});
//             }
//         }

//         let member = new Member({  // req body theke ja paisi, ta ei variable gulay save chhilo.
//             name,
//             email,
//             password: hashPass,
//             messid: messid == "noob" ? randomingMessId(6) : messid
//           });

        
//         //variable er data gula ekhn database a save korar palla.
//          member = await member.save();
      
//         return res.json(member);
      
      
//         return res.status(200).json({ message: 'User created successfully.' });
      
//     }catch(e){
//         return res.status(500).json({"error": e.message})
//     }

   

// });





module.exports = mealRouter ;