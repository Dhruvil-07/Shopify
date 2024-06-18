const mongoose = require('mongoose');

//subCategory Schema 
const SubCategorySchema = mongoose.Schema({
    name : {
        type:String,
        require : true,
        unique : true,
    },
    categoryId:{
        type:mongoose.Schema.Types.ObjectId,
        ref : 'category',
        require : true,
    }
},{ timestamps: true });


//subcategory Model
const SubCategoryModel = mongoose.model('SubCategory',SubCategorySchema);

module.exports = SubCategoryModel;