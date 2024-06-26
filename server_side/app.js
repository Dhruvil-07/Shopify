const express = require("express");
const app = express();
const cors = require('cors');

//env file
require("dotenv").config();

//middelware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(cors());


//database file
const db = require('./db');


//auth service
const AuthService = require("./AuthService/Auth.service");


//error service 
const ErrorHandlerMiddelware = require('./middelware/ErrorHandler.middelware');
const CustomError = require("./utils/ErrorHandler");


//image service
app.use('/images/category',express.static('public/category'));
app.use('/images/product',express.static('public/product'));
app.use('/images/poster',express.static('public/poster'));


//routes
app.use('/user',require('./route/user.route'));
app.use('/category',require('./route/category.route'));
app.use('/subcategory',require('./route/subCategory.route'));
app.use('/brand',require('./route/brand.route'));
app.use('/varianttype',require('./route/variantType.route'));
app.use('/variant',require('./route/variant.route'));
app.use('/product',require('./route/product.route'));
app.use('/poster',require('./route/poster.route'));
app.use('/coupon',require('./route/coupon.route'));



//handle invalid route
app.all('*',(req,res,next)=>{
    next(new CustomError("Invalid Route",404))
});


//error middelware
app.use(ErrorHandlerMiddelware);


//create server 
app.listen(process.env.PORT , ()=>console.log('server start and up'));