const mongoose = require("mongoose");
const CategoryModel = require('../model/category.model');
const UserModel = require('../model/user.model');
const { categoryUpload } = require('../fileupload');
const CustomError = require('../utils/ErrorHandler');
const multer = require("multer");
const fs = require('fs');
const categoryModel = require("../model/category.model");


//create new catgory
async function createCategory(req, res, next) {
    const UserData = await UserModel.findOne({ _id: req.UserId });

    if (UserData.role != 'admin') {
        return next(new CustomError("Unauthorize User", 401));
    }

    categoryUpload.single('img')(req, res, async (err) => {
        if (req.body.name === undefined) {
            return next(new CustomError("Category Name is Require", 403));
        }
        else if (err instanceof multer.MulterError) {
            next(new CustomError("File Is Too Large", 404));
        }
        else if (err) {
            next(new CustomError(err.message, 404));
        }
        else {
            
            try {
                const payload =
                {
                    name: req.body.name,
                    image: `http://localhost:8000/images/category/${req.file.filename}`,
                }

                const newobj = new CategoryModel(payload);
                const categorydtl = await newobj.save();

                return res.status(201).json({
                    status: "success",
                    categorydtl: categorydtl,
                });
            }
            catch (err) {
                if(err.code === 11000) 
                    fs.unlink(`./public/category/${req.file.filename}`,(err)=>{
                        console.log(err);
                    });
                next(err);
            }

        }
    });
}


//get all category
async function getAllCategory(req, res, next) {
    const AllCategory = await categoryModel.find();

    return res.status(200).json({
        status: "success",
        total: AllCategory.length,
        category: AllCategory,
    });
}

module.exports = {
    createCategory,
    getAllCategory,
}