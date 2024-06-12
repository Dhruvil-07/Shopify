const mongoose = require('mongoose');

//veriant schema
const VariantSchema = mongoose.Schema({
    name : 
    {
        type : String,
        require : true
    },
    VariantTypeId : 
    {
        type : mongoose.Schema.Types.ObjectId,
        ref : "VariantType",
        require : true,
    }
},{ timestamps: true });


//variant model
const VariantModel = mongoose.model('Variant',VariantSchema);

module.exports = VariantModel;

