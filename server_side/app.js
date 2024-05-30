const express = require("express");
const app = express();

//env file
require("dotenv").config();


//create server 
app.listen(process.env.PORT , ()=>console.log('server start and up'));