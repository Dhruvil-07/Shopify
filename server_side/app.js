const express = require("express");
const app = express();

//env file
require("dotenv").config();

//middelware
app.use(express.json());
app.use(express.urlencoded({extended : false}));


//routes
app.use('/user',require('./route/user.route'));


//database file
const db = require('./db');


//create server 
app.listen(process.env.PORT , ()=>console.log('server start and up'));