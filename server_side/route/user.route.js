const express = require("express");
const router = express.Router();

const asynchandler = require('../middelware/trycatchhandler');

//import anuthentication service
const AuthService = require("../AuthService/Auth.service");

//controller import
const UserController = require("../controller/user.controller");

//user creation route
router.post('/reg',UserController.User_Create);

//get all users
router.get('/',AuthService.VerifyToken,UserController.GetAllUser);

//user detail get route
router.get('/:id',AuthService.VerifyToken,UserController.UserDtl);

//user delete route
router.delete('/:id',AuthService.VerifyToken,UserController.User_Delete);

//user login route
router.post('/login',UserController.Login);


//demo routed

module.exports = router;