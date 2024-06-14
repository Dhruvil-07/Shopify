const mongoose = require("mongoose");
const UserModel = require('../model/user.model');
const ProductModel = require('../model/product.model');
const { productUpload } = require('../fileupload');
const CustomError = require('../utils/ErrorHandler');
const multer = require("multer");
const fs = require('fs');


//create new product 
async function RegNewProduct(req,res,next){

    const UserData = await UserModel.findOne({ _id: req.UserId });

    if (UserData.role != 'admin') {
        return next(new CustomError("Unauthorize User", 401));
    }

    productUpload.array('photos',5)(req,res,async (err)=>{
        if(err instanceof multer.MulterError)
        {
            console.log(err.code);
            return next(err);
        }    
        else if(err)
        {
            return next(new CustomError(err.message,404));
        }    

        //create pdoduct doc in mongodb
        try
        {
            const {name, description, quantity, price, offerPrice, proCategoryId, proSubCategoryId, proBrandId, proVariantTypeId, proVariantId} = req.body;

            if (!name || !quantity || !price || !proCategoryId || !proSubCategoryId) 
            {
                //remove all pics
                req.files.forEach((data)=>{
                    fs.unlink(`./public/product/${data.filename}`,(err)=>{
                        console.log(err);
                    });
                });

                //return error
                return next(new CustomError("All Field is require",400));
            }

            const imageUrls = [];

            req.files.forEach((data,index) => {
                imageUrls.push({
                    image:index+1,
                    url : `http://localhost:8000/images/product/${data.filename}`,
                });
            });

            const newobj = new ProductModel({name, description, quantity, price, offerPrice, proCategoryId, proSubCategoryId, proBrandId, proVariantTypeId, proVariantId , images:imageUrls});
            const newProduct = await newobj.save();

            return res.status(201).json({
                status : "Success",
                data : newProduct,
            });
        }
        catch(err)
        { 
            return next(err);
        }      
    });
}


//get all product 
async function GetAllProducts(req,res,next)
{
    console.log("hitted");
    const AllData = await ProductModel.find(req.query)
                          .populate("proCategoryId",'id name')
                          .populate("proSubCategoryId",'id name')
                          .populate("proBrandId",'id name')
                          .populate("proVariantTypeId",'id name')
                          .populate("proVariantId");

    return res.status(200).json({
        status : "Success",
        data : AllData,
    });
}


//get specific 
async function GetspecificProduct(req,res,next)
{
    const ProductData = await ProductModel.findById(req.params.id)
                          .populate("proCategoryId",'id name')
                          .populate("proSubCategoryId",'id name')
                          .populate("proBrandId",'id name')
                          .populate("proVariantTypeId",'id name')
                          .populate("proVariantId");

    if(!ProductData)
    {
        return next(new CustomError("Product Not Register",401));
    }

    return res.status(200).json({
        status : "Success",
        data : ProductData,
    });
}


module.exports = {
    RegNewProduct,
    GetAllProducts,
    GetspecificProduct,
}