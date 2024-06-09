const mongoose = require('mongoose');

//category schema
const categorySchema = mongoose.Schema({
    name : {
        type:String,
        require : true,
        unique : true,
    },
    image : {
        type : String,
        require : true,
    }
});


//Category model
const categoryModel = mongoose.model('category',categorySchema);

module.exports = categoryModel;