const mongoose = require("mongoose");
const UserModel = require('../model/user.model');
const CouponModel = require('../model/coupon.model');
const CustomError = require('../utils/ErrorHandler');


//reg new coupon
async function RegNewCoupon(req,res,next)
{
    const UserData = await UserModel.findOne({ _id: req.UserId });

    if (UserData.role != 'admin') {
        return next(new CustomError("Unauthorize User", 401));
    }

    const { couponCode, discountType, discountAmount, minimumPurchaseAmount, endDate, status, applicableCategory, applicableSubCategory, applicableProduct } = req.body;

    if (!couponCode || !discountType || !discountAmount || !endDate || !status) {
        return next(new CustomError("All Field are require",401));
    }

    const newObj = new CouponModel(req.body);
    const newCoupon = await newObj.save();

    return res.status(201).json({
        status : "Success",
        data : newCoupon,
    });
}



//get all coupon
async function GetAllCoupon(req,res,next)
{
    const AllData = await CouponModel.find(req.query);

    return res.status(200).json({   
        status : "Success",
        data : AllData,
    });
}


//get specific coupon 
async function GetspecificCoupon(req,res,next)
{
    const CouponData = await CouponModel.findById(req.params.id);

    if(!CouponData)
    {
        return next(new CustomError("Coupon not register",401));
    }   

    return res.status(200).json({
        status : "Success",
        data : CouponData,
    });
}


//delete Specific Coupon
async function DeleteCoupon(req,res,next)
{
    const UserData = await UserModel.findOne({ _id: req.UserId });

    if (UserData.role != 'admin') {
        return next(new CustomError("Unauthorize User", 401));
    }

    const CouponData = await CouponModel.findByIdAndDelete(req.params.id);

    if(!CouponData)
    {
        return next(new CustomError("Coupon not Found",401));
    }  

    return res.status(200).json({
        status: "Success",
        msg : "Coupon Deleted SuccessFully",
    });
}

module.exports = {
    RegNewCoupon,
    GetAllCoupon,
    GetspecificCoupon,
    DeleteCoupon,
}