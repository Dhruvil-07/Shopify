const mongoose = require("mongoose");
const UserModel = require("../model/user.model");
const AuthService = require("../AuthService/Auth.service");


//creation contoller
async function User_Create(req,res)
{   
    try
    {
        const NewUserObj = await UserModel(req.body);
        const NewUser = await NewUserObj.save();
        console.log(NewUser);
        return res.status(201).json({status:"success",data:NewUser});
    }
    catch(err)
    {
        console.log(err);
        return res.status(500).json({status:"fail",msg:err});
    }
}


//user detial get 
async function UserDtl(req,res)
{
    try
    {
        const UserDetail = await UserModel.findOne({_id:req.params.id});

        if(!UserDetail)
        {
            return res.status(401).json({status:"fail",msg:"User Not Found"});    
        }    

        return res.status(200).json({status:"success",data:UserDetail});
    }
    catch(err)
    {
        return res.status(500).json({status:"fail",msg:err});
    }
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
async function GetAllUser(req,res)
{
    try
    {
        const UsersData = await UserModel.find();

        return res.status(200).json({
            status:"success", 
            total_User : UsersData.length,
            data : UsersData,
        })
    }
    catch(err)
    {
        return res.status(500).json({status:"failed",msg:"Internal Server Error"});
    }
}


//login function
async function Login(req,res)
{
    try
    {
        const {email,password} = req.body;

        const UserData = await UserModel.findOne({email:email});

        if(!UserData)
        {
            return res.status(404).json({status:404,msg:"User Not Found"});
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
    catch(err)
    {
        console.log(err);
        return res.status(500).json({status:500 , msg:"Intenal Server Error"});
    }
}


module.exports = {
    User_Create,
    UserDtl,
    User_Delete,
    GetAllUser,
    Login,
}