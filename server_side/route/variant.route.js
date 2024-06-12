const express = require('express');
const router = express.Router();

//trycatch handler
const trycatchHandler = require('../middelware/trycatchhandler');

//import anuthentication service
const AuthService = require("../AuthService/Auth.service");

//VariantType controller
const VarianController = require('../controller/variant.controller');


//VariantType Route
router.post('/reg',AuthService.VerifyToken,trycatchHandler(VarianController.RegNewVariant));
router.get('/',AuthService.VerifyToken, trycatchHandler(VarianController.getAllVariangt));
router.get('/:id',AuthService.VerifyToken,trycatchHandler(VarianController.getSpecificVariant));


module.exports = router;
