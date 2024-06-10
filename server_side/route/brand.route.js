const express = require('express');
const router = express.Router();

//trycatch handler
const trycatchHandler = require('../middelware/trycatchhandler');

//import anuthentication service
const AuthService = require("../AuthService/Auth.service");

//category controller
const BrandController = require('../controller/brand.controller');


//sub category routes
router.post('/reg',AuthService.VerifyToken,trycatchHandler(BrandController.RegNewBrand));
router.get('/',AuthService.VerifyToken, trycatchHandler(BrandController.getAllBrand));
router.get('/:id',AuthService.VerifyToken,trycatchHandler(BrandController.getSpecificBrand));

module.exports = router;
