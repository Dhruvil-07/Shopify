const mongoose = require("mongoose");
const UserModel = require('../model/user.model');
const CustomError = require("../utils/ErrorHandler");
const VariantTypeModel = require('../model/variantType.model');

//reg new variantType
async function RegNewVariantType(req,res,next)
{
    const UserData = await UserModel.findOne({_id:req.UserId});

    if(UserData.role != 'admin')
    {
        return next(new CustomError("Unauthorize User",401));
    }

    if( req.body.name === undefined || req.body.type === undefined)
    {
        return next(new CustomError("Variant name or type require",403));
    }       

    const newobj = new VariantTypeModel(req.body);
    const newVariantType = await newobj.save();

    return res.status(201).json({
        status:"Success",
        data : newVariantType,
    });
}


//get new brand
async function getAllVariangtType(req,res,next)
{
    const Alldata = await VariantTypeModel.find();

    return res.status(200).json({
        status : "Success",
        data : Alldata,
    });
}


//get specific brand
async function getSpecificVariantType(req,res,next)
{   
    const data = await VariantTypeModel.findById({_id:req.params.id});
    
    if(!data)
    {
        return next(new CustomError("VarientType Not Register",404));
    }    

    return res.status(200).json({
        status : "Success",
        data : data,
    });
}

module.exports = {
    RegNewVariantType,
    getAllVariangtType,
    getSpecificVariantType,
};
