const mongoose = require("mongoose");
const subCategoryModel = require('../model/subCategory.model');
const UserModel = require('../model/user.model');
const CustomError = require("../utils/ErrorHandler");

//reg new subCategory
async function RegNewsubCategory(req,res,next)
{
    const UserData = await UserModel.findOne({_id:req.UserId});

    if(UserData.role != 'admin')
    {
        return next(new CustomError("Unauthorize User",401));
    }

    if(req.body.name === undefined)
    {
        return next(new CustomError("Name Is Require",403));
    }    

    if(req.body.categoryId === undefined)
    {
        return next(new CustomError("Category is require",403));
    }    

    const newobj = new subCategoryModel(req.body);
    const newSubCategory = await newobj.save();

    return res.status(201).json({
        status:"Success",
        data : newSubCategory,
    });
}


//get new subcategory
async function getAllSubCategory(req,res,next)
{
    const Alldata = await subCategoryModel.find().populate('categoryId');

    return res.status(200).json({
        status : "Success",
        data : Alldata,
    });
}


//get specific category
async function getSpecificsubCategory(req,res,next)
{   
    const data = await subCategoryModel.findOne({_id:req.params.id});
    
    if(!data)
    {
        return next(new CustomError("SubCategory Not Register",404));
    }    

    return res.status(200).json({
        status : "Success",
        data : data,
    });
}


module.exports = {
    RegNewsubCategory,
    getAllSubCategory,
    getSpecificsubCategory,
}