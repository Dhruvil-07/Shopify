const express = require('express');
const router = express.Router();

//trycatch handler
const trycatchHandler = require('../middelware/trycatchhandler');

//import anuthentication service
const AuthService = require("../AuthService/Auth.service");

//category controller
const SubCategorycontroller = require('../controller/subCategory.controller');


//sub category routes
router.post('/reg',AuthService.VerifyToken,trycatchHandler(SubCategorycontroller.RegNewsubCategory));
router.get('/',AuthService.VerifyToken, trycatchHandler(SubCategorycontroller.getAllSubCategory));
router.get('/:id',AuthService.VerifyToken,trycatchHandler(SubCategorycontroller.getSpecificsubCategory));

module.exports = router;
