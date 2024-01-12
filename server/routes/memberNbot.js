const express = require("express");
const MealInfo = require("../models/mealInfo");
const schedule = require("node-schedule");
const { getTime } = require("../generator");

const mealRouter = express.Router();

const currentDate = new Date();

const year = currentDate.getFullYear();
const month = currentDate.getMonth() + 1; // Note: Months are zero-based, so add 1
const day = currentDate.getDate();

const formattedDate = `${year}-${month < 10 ? "0" + month : month}-${
  day < 10 ? "0" + day : day
}`;

mealRouter.post("/api/sign-meal", async (req, res) => {
  try {
    // ekhane name messID mealMenu mealCount recieve korbo jst,
    // pore seta MealInfo er sathe time onujayi align kore nibo.
    const { name, messid } = req.body;

    let pushMeal = new MealInfo({
      name,
      messid,
      lunchMeal: "Chicken",
      lunchCount: 1,
      lunchComment: "",
      date: formattedDate,
    });

    pushMeal = await pushMeal.save();
    return res.json(pushMeal);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

mealRouter.post("/api/mealInfo", async (req, res) => {
  try {
    // ekhane name messID mealMenu mealCount recieve korbo jst,
    // pore seta MealInfo er sathe time onujayi align kore nibo.
    const { name, messid, mealMenu, count, comment } = req.body;

    let pushMeal = new MealInfo({
      name,
      messid,
      lunchMeal: mealMenu,
      lunchCount: count,
      lunchComment: comment,
      date: formattedDate,
    });

    pushMeal = await pushMeal.save();
    return res.json(pushMeal);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

mealRouter.get("/api/get-meals", async (req, res) => {
  try {
    const messid = req.query.messid;
    //  console.log(messid);
    const meals = await MealInfo.find({ messid: messid, date: formattedDate }); // jodi search functionality add korte hoy tobe ei find er moddhe search er character recieve korbe

    res.json(meals);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
//------------------------------------------------------------------------
// Auto meal update in a time
mealRouter.post("/api/scheduled-meal", async (req, res) => {
  try {
    // ekhane name messID mealMenu mealCount recieve korbo jst,
    // pore seta MealInfo er sathe time onujayi align kore nibo.
    const { name, messid, mealMenu, count, comment } = req.body;

    let pushMeal = new MealInfo({
      name,
      messid,
      lunchMeal: mealMenu,
      lunchCount: count,
      lunchComment: comment,
      date: formattedDate,
    });

    pushMeal = await pushMeal.save();
    return res.json(pushMeal);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});
//console.log(getTime('hour'));
const pushJob = schedule.scheduleJob("* 21 51 * * *", async () => {
  console.log("helloooo");
  //find the meal data of todays date and store in array

  pushJob.cancel();
});

schedule.scheduleJob("push-job", "* 12 22 * * *", async () => {
  console.log("Good job dude");
  const todaysMeal = await MealInfo.find({ date: formattedDate });
 // console.log(todaysMeal);
  // post the data again with a loop.
  for (const user of todaysMeal) {
    let pushMeal = new MealInfo({
      name: user.name,
      messid: user.messid,
      date: formattedDate, // updateeee
      lunchMeal: user.lunchMeal,
      lunchCount: user.lunchCount,
      dinnerMeal: user.dinnerMeal,
      dinnerCount: user.dinnerCount,
      lunchComment: "",
      dinnerComment: "",
    });
     // console.log("DOneeeeeeeeee");

    pushMeal = await pushMeal.save();
  }

  schedule.cancelJob("push-job");
});

module.exports = mealRouter;
