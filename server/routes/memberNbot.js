const express = require("express");
const MealInfo = require("../models/mealInfo");




const mealRouter = express.Router();

mealRouter.post("/api/mealInfo",async (req,res)=>{
    
    const currentDate = new Date();

    const year = currentDate.getFullYear();
    const month = currentDate.getMonth() + 1; // Note: Months are zero-based, so add 1
    const day = currentDate.getDate();

    const formattedDate = `${year}-${month < 10 ? '0' + month : month}-${day < 10 ? '0' + day : day}`;

    try{
        // ekhane name messID mealMenu mealCount recieve korbo jst,
        // pore seta MealInfo er sathe time onujayi align kore nibo.
        const { name, messid, mealMenu, count, comment  } = req.body;

        let pushMeal = new MealInfo({
            name,
            messid,
            lunchMeal: mealMenu,
            lunchCount: count,
            lunchComment: comment,
            date: formattedDate

        });

        pushMeal = await pushMeal.save();
        return res.json(pushMeal);


    }catch(e){
        return res.status(500).json({"error": e.message})

    }

})





module.exports = mealRouter ;