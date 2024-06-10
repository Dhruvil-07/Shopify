const mongoose = require("mongoose");
const UserModel = require('../model/user.model');
const CustomError = require("../utils/ErrorHandler");
const BrandModel = require("../model/brand.model");

//reg new subCategory
async function RegNewBrand(req,res,next)
{
    const UserData = await UserModel.findOne({_id:req.UserId});

    if(UserData.role != 'admin')
    {
        return next(new CustomError("Unauthorize User",401));
    }

    if(req.body.name === undefined)
    {
        return next(new CustomError("Brand Name Is Require",403));
    }    

    if(req.body.subcategoryId === undefined)
    {
        return next(new CustomError("Sub Category is require",403));
    }    

    const newobj = new BrandModel(req.body);
    const newBrand = await newobj.save();

    return res.status(201).json({
        status:"Success",
        data : newBrand,
    });
}



//get new brand
async function getAllBrand(req,res,next)
{
    const Alldata = await BrandModel.find().populate("subcategoryId"); //populate not work , will resolve it

    return res.status(200).json({
        status : "Success",
        data : Alldata,
    });
}


//get specific brand
async function getSpecificBrand(req,res,next)
{   
    const data = await BrandModel.findById({_id:req.params.id}).populate("subcategoryId"); //populate not work , will resolve it
    
    if(!data)
    {
        return next(new CustomError("Brand Not Register",404));
    }    

    return res.status(200).json({
        status : "Success",
        data : data,
    });
}


module.exports = {
    RegNewBrand,
    getAllBrand,
    getSpecificBrand,
}