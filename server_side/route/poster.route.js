const express = require('express');
const router = express.Router();

//trycatch handler
const trycatchHandler = require('../middelware/trycatchhandler');

//import anuthentication service
const AuthService = require("../AuthService/Auth.service");

//category controller
const PosterController = require('../controller/poster.controller');


//category route

//create new category 
router.post('/reg',AuthService.VerifyToken,trycatchHandler(PosterController.RegNewPoster));
router.get('/',AuthService.VerifyToken,trycatchHandler(PosterController.getAllPoster));
router.get('/:id',AuthService.VerifyToken,trycatchHandler(PosterController.getSpecificPoster));
router.delete('/:id',AuthService.VerifyToken,trycatchHandler(PosterController.deletePoster));

module.exports = router;