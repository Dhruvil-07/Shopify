const multer = require('multer');
const path = require('path');

//category upload
const CategoryStorage = multer.diskStorage({
    destination : "./public/category",
    filename : (req,file,cb)=>{

        const filetype = /jpg|jpeg|png/;
        const extname = filetype.test(path.extname(file.originalname).toLowerCase());

        if(extname)
        {
            return cb(null,`${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`);
        }
        else
        {
            return cb(new Error("only jpg , jpeg anfd png file allowed"));
        }
        
    }
});


const categoryUpload = multer({
    storage : CategoryStorage,
    limits : {
        fileSize : 1024 * 1024 * 5,
    }
});



//product upload

const ProductStorage = multer.diskStorage({
    destination : "./public/product",
    filename : (req,file,cb)=>{
        const filetype = /jpg|jpeg|png/;
        const extname = filetype.test(path.extname(file.originalname).toLowerCase());

        if(extname)
        {
            return cb(null,`${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`);
        }   
        else
        {
            return cb(new Error("only jpg , jpeg anfd png file allowed"));
        } 
    }
});

const productUpload = multer({
    storage : ProductStorage,
    limits : {
        fileSize : 1024 * 1024 * 1,
    },
});





module.exports = {
    categoryUpload,
    productUpload,
};