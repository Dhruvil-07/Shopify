const mongoose = require("mongoose");
const UserModel = require('../model/user.model');
const CustomError = require("../utils/ErrorHandler");
const VariantModel = require('../model/variant.model');

//reg new variantType
async function RegNewVariant(req,res,next)
{
    const UserData = await UserModel.findOne({_id:req.UserId});

    if(UserData.role != 'admin')
    {
        return next(new CustomError("Unauthorize User",401));
    }

    if( req.body.name === undefined || req.body.VariantTypeId === undefined)
    {
        return next(new CustomError("All Fiels is complosory",403));
    }       

    const newobj = new VariantModel(req.body);
    const newVariant = await newobj.save();

    return res.status(201).json({
        status:"Success",
        data : newVariant,
    });
}


//get new brand
async function getAllVariangt(req,res,next)
{
    const Alldata = await VariantModel.find();

    return res.status(200).json({
        status : "Success",
        data : Alldata,
    });
}


//get specific brand
async function getSpecificVariant(req,res,next)
{   
    const data = await VariantModel.findById({_id:req.params.id});
    
    if(!data)
    {
        return next(new CustomError("Varient  Not Register",404));
    }    

    return res.status(200).json({
        status : "Success",
        data : data,
    });
}

module.exports = {
    RegNewVariant,
    getAllVariangt,
    getSpecificVariant,
};
