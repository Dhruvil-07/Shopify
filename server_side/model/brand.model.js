const mongoose = require('mongoose');

//brand Schema 
const BrandSchema = mongoose.Schema({
    name : {
        type:String,
        require : true,
    },
    subcategoryId :{
        type: mongoose.Schema.Types.ObjectId,
        ref : 'SubCategory',
        require : true,
    }
});


//subcategory Model
const BrandModel = mongoose.model('brand',BrandSchema);

module.exports = BrandModel;