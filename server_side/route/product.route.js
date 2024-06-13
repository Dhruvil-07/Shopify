const express = require('express');
const router = express.Router();

//trycatch handler
const trycatchHandler = require('../middelware/trycatchhandler');

//import anuthentication service
const AuthService = require("../AuthService/Auth.service");

//category controller
const ProductController = require('../controller/product.controller');

//product routes
router.post('/reg',AuthService.VerifyToken,trycatchHandler(ProductController.RegNewProduct));
router.get('/',AuthService.VerifyToken,trycatchHandler(ProductController.GetAllProducts));
router.get('/:id',AuthService.VerifyToken,trycatchHandler(ProductController.GetspecificProduct));


module.exports = router;