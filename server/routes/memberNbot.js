const express = require("express");
const MealInfo = require("../models/mealInfo");

const mealRouter = express.Router();

const currentDate = new Date();

    const year = currentDate.getFullYear();
    const month = currentDate.getMonth() + 1; // Note: Months are zero-based, so add 1
    const day = currentDate.getDate();

    const formattedDate = `${year}-${month < 10 ? '0' + month : month}-${day < 10 ? '0' + day : day}`;

mealRouter.post("/api/mealInfo",async (req,res)=>{
    
    

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

mealRouter.get("/api/get-meals", async (req, res) => {
    try {
        console.log(formattedDate);
        const { messid } = req.body;
      const meals = await MealInfo.find({messid: messid, date:formattedDate}); // jodi search functionality add korte hoy tobe ei find er moddhe search er character recieve korbe
      res.json(meals);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });





module.exports = mealRouter ;