const express = require("express");
const router = express.Router();

//trycatch handler
const trycatchHandler = require('../middelware/trycatchhandler');

//import anuthentication service
const AuthService = require("../AuthService/Auth.service");

//controller import
const UserController = require("../controller/user.controller");


//user creation route
router.post('/reg',trycatchHandler(UserController.User_Create));

//get all users
router.get('/',AuthService.VerifyToken,trycatchHandler(UserController.GetAllUser));

//user detail get route
router.get('/:id', AuthService.VerifyToken,trycatchHandler(UserController.UserDtl));

//user delete route
router.delete('/:id',AuthService.VerifyToken,UserController.User_Delete);

//user login route
router.post('/login',trycatchHandler(UserController.Login));


module.exports = router;