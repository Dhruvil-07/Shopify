const mongoose = require("mongoose");
const UserModel = require("../model/user.model");
const AuthService = require("../AuthService/Auth.service");
const ErrorHandlerclass = require('../utils/ErrorHandler');

//creation contoller
async function User_Create(req,res,next)
{       
    const NewUserObj = await UserModel(req.body);
    const NewUser = await NewUserObj.save();
    console.log(NewUser);
    return res.status(201).json({status:"success",data:NewUser});
}


//user detial get 
async function UserDtl(req,res,next)
{
        const UserDetail = await UserModel.findOne({_id:req.params.id});

        //when charater chage in id
        if(!UserDetail)
        {
            next(new ErrorHandlerclass("User Not Found",404));
        }    

        return res.status(200).json({status:"success",data:UserDetail});
}


//uset deletion route
async function User_Delete(req,res)
{
    try
    {
        const DeletedUser = await UserModel.findByIdAndDelete({_id:req.params.id});
        
        if(!DeletedUser)
        {
            return res.status(404).json({status:'Fail',msg:'User Not Found'});    
        }
    
        return res.status(200).json({status:'success',msg:'User Deleted Succeessfully!!!'});
    }
    catch(err)
    {
        return res.status(500).json({status:"fail" , msg:"Internal Server Error"});
    }
}


//all user fet
async function GetAllUser(req,res,next)
{
        const adminData = await UserModel.find({_id : req.UserId});

        if(adminData.role != 'admin')
        {
            next(new ErrorHandlerclass("Unathorized User",401));
        }

        const UsersData = await UserModel.find();

        return res.status(200).json({
            status:"success", 
            total_User : UsersData.length,
            data : UsersData,
        })
}


//login function
async function Login(req,res,next)
{
        const {email,password} = req.body;

        const UserData = await UserModel.findOne({email:email});

        if(!UserData)
        {
            next(new ErrorHandlerclass("User not Found",404));
        }

        //pending
        // if(!(await UserModel.comparepwd(UserData.password,password)) )
        // {
        //     console.log("not match");
        // }    

        return res.status(200).json({
            status : "Success",
            Token : await AuthService.GenToken(UserData.id)
        })
}


module.exports = {
    User_Create,
    UserDtl,
    User_Delete,
    GetAllUser,
    Login,
}