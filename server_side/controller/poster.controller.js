const mongoose = require("mongoose");
const UserModel = require('../model/user.model');
const PosterModel = require('../model/poster.model');
const { posterUpload } = require('../fileupload');
const CustomError = require('../utils/ErrorHandler');
const multer = require("multer");
const fs = require('fs');


//crate new poster
async function RegNewPoster(req, res, next) {
    const UserData = await UserModel.findOne({ _id: req.UserId });

    if (UserData.role != 'admin') {
        return next(new CustomError("Unauthorize User", 401));
    }

    posterUpload.single('img')(req, res, async (err) => {
        if (req.body.name === undefined) {
            return next(new CustomError("Poster Name is Require", 403));
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
                    posterName: req.body.name,
                    imageUrl: `http://localhost:8000/images/poster/${req.file.filename}`,
                }

                const newobj = new PosterModel(payload);
                const Posterdtl = await newobj.save();

                return res.status(201).json({
                    status: "success",
                    posterdata : Posterdtl,
                });
            }
            catch (err) {

                        fs.unlink(`./public/poster/${req.file.filename}`,(err)=>{
                            console.log(err);
                        });

                next(err);
            }

        }
    });
}


//get all poster
async function getAllPoster(req, res, next) {
    const AllData = await PosterModel.find();

    return res.status(200).json({
        status: "success",
        total: AllData.length,
        posterdata : AllData,
    });
}

//get specific poster
async function getSpecificPoster(req,res,next)
{
    const PosterData = await PosterModel.findOne({_id:req.params.id});

    if(PosterData === null)
    {
        return next(new CustomError("Poster Not Found",404));
    }    

    return res.status(200).json({
        msg : "Success",
        data : PosterData,
    });
}


//delete specific poster
async function deletePoster(req,res,next)
{
    const UserData = await UserModel.findOne({ _id: req.UserId });

    if (UserData.role != 'admin') {
        return next(new CustomError("Unauthorize User", 401));
    }

    const posterData = await PosterModel.findById(req.params.id);

    if(!posterData)
    {
        return next(new CustomError("Poster not Found",404));
    }   

    const img_dtl = posterData.imageUrl.slice(36,57);

    const deletedData = await PosterModel.findByIdAndDelete(req.params.id);
    
    fs.unlink(`./public/poster/${img_dtl}`,(err)=>{
        console.log(err);
        return;
    });

    return res.status(200).json({
        status : "success",
        msg : "Poster Deleted Successfully",
    });
}

module.exports = {
    RegNewPoster,
    getAllPoster,
    getSpecificPoster,
    deletePoster,
}
