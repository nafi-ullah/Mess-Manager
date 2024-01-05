const mymongo = require("mongoose");

//create schema
// create model of that schema
//export, so that save in database.

const memberSchema = mymongo.Schema({
    name: {},
    email: {},
    password: {},
    messid: {}

});

const member = mymongo.model("Member", memberSchema);

module.exports = member;