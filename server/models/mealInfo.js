const mealMongo = require("mongoose");

//create schema
// create model of that schema
//export, so that save in database.

const mealInfoSchema = mealMongo.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    date: {
        type: String,
        trim: true,
        
    },
    lunchMeal: {
        type: String,
        trim: true,
        
    },
    lunchCount: {
        type: Number,
        trim: true,
    },
    lunchMeal: {
        type: String,
        trim: true,  
    },
    lunchCount: {
        type: Number,
        trim: true,
    },
    lunchComment: {
        type: String,
    },
    dinnerComment: {
        type: String,
    }

});

const mealInfo = mealMongo.model("MealInformation", mealInfoSchema);

module.exports = mealInfo;