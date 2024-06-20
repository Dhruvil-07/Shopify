const mongoose = require('mongoose');

const demoprdSchema = mongoose.Schema({
    name : 
    {
        type:String,
        require : true,
    },
    qty :
    {
        type : Number,
        require:true,
    },
    catid : 
    {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'category',
        require : true,
    }
});

const demoprdModel = mongoose.model('demoprd',demoprdSchema);

module.exports = demoprdModel;