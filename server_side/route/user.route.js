const express = require("express");
const router = express.Router();

//controller import
const UserController = require("../controller/user.controller");

//user creation route
router.post('/reg',UserController.User_Create);

//user detail get route
router.get('/:id',UserController.UserDtl);

//user delete route
router.delete('/:id',UserController.User_Delete);

module.exports = router;