const express = require("express");

const { addDays, format } = require('date-fns');

const bazarRouter = express.Router();

const currentDate = new Date();
const formattedDate = format(currentDate, 'yyyy-MM-dd');




module.exports = bazarRouter;
