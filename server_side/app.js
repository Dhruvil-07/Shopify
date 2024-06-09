const express = require("express");
const app = express();

//env file
require("dotenv").config();

//middelware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());


//database file
const db = require('./db');


//auth service
const AuthService = require("./AuthService/Auth.service");


//error service 
const ErrorHandlerMiddelware = require('./middelware/ErrorHandler.middelware');
const CustomError = require("./utils/ErrorHandler");


//image service
app.use('/images/category',express.static('public/category'));


//routes
app.use('/user',require('./route/user.route'));
app.use('/category',require('./route/category.route'));


//handle invalid route
app.all('*',(req,res,next)=>{
    next(new CustomError("Invalid Route",404))
});


//error middelware
app.use(ErrorHandlerMiddelware);


//create server 
app.listen(process.env.PORT , ()=>console.log('server start and up'));