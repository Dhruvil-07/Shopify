const express = require('express');
const router = express.Router();

//trycatch handler
const trycatchHandler = require('../middelware/trycatchhandler');

//import anuthentication service
const AuthService = require("../AuthService/Auth.service");

//category controller
const Couponcontroller = require('../controller/coupon.controller');

//product routes
router.post('/reg',AuthService.VerifyToken,trycatchHandler(Couponcontroller.RegNewCoupon));
router.get('/',AuthService.VerifyToken,trycatchHandler(Couponcontroller.GetAllCoupon));
router.get('/:id',AuthService.VerifyToken,trycatchHandler(Couponcontroller.GetspecificCoupon));
router.delete('/:id',AuthService.VerifyToken,trycatchHandler(Couponcontroller.DeleteCoupon));



module.exports = router;