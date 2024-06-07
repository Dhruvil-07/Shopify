const express = require("express");
const app = express();
const AuthService = require("./AuthService/Auth.service");
const ErrorHandlerMiddelware = require('./middelware/ErrorHandler.middelware');

//env file
require("dotenv").config();

//middelware
app.use(express.json());
app.use(express.urlencoded({extended : false}));


//database file
const db = require('./db');


//routes
app.use('/user',require('./route/user.route'));



//error middelware
app.use(ErrorHandlerMiddelware);

//create server 
app.listen(process.env.PORT , ()=>console.log('server start and up'));