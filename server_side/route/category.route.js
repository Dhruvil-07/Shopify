const express = require('express');
const router = express.Router();

//trycatch handler
const trycatchHandler = require('../middelware/trycatchhandler');

//import anuthentication service
const AuthService = require("../AuthService/Auth.service");

//category controller
const CategoryController = require('../controller/category.controller');


//category route

//create new category 
router.post('/reg',AuthService.VerifyToken,trycatchHandler(CategoryController.createCategory));

//get all category
router.get('/',AuthService.VerifyToken,trycatchHandler(CategoryController.getAllCategory));

//get specific category
router.get('/:id',AuthService.VerifyToken,trycatchHandler(CategoryController.getSpecificCategory));

module.exports = router;