const express = require('express');
const router = express.Router();

//trycatch handler
const trycatchHandler = require('../middelware/trycatchhandler');

//import anuthentication service
const AuthService = require("../AuthService/Auth.service");

//VariantType controller
const VarianTypeController = require('../controller/variantType.controller');


//VariantType Route
router.post('/reg',AuthService.VerifyToken,trycatchHandler(VarianTypeController.RegNewVariantType));
router.get('/',AuthService.VerifyToken, trycatchHandler(VarianTypeController.getAllVariangtType));
router.get('/:id',AuthService.VerifyToken,trycatchHandler(VarianTypeController.getSpecificVariantType));


module.exports = router;
