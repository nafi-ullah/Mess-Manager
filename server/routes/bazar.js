const express = require("express");
const BazarInfo = require("../models/bazarModel");

const { format } = require('date-fns');

const bazarRouter = express.Router();

const currentDate = new Date();
const formattedDate = format(currentDate, 'yyyy-MM-dd');


bazarRouter.post("/api/bazarInfo", async (req, res) => {
    try {
      // ekhane name messID mealMenu mealCount recieve korbo jst,
      // pore seta MealInfo er sathe time onujayi align kore nibo.
      const { name, messid, bazar, quantity, cost } = req.body;

      let pushBazar = new BazarInfo({
        name,
        messid,
        bazar,
        cost,
        quantity,
        date : formattedDate 
      });
      
      pushBazar = await pushBazar.save();
      return res.json(pushBazar);
     
    } catch (e) {
      return res.status(500).json({ error: e.message });
    }
  });



module.exports = bazarRouter;
