const mongoose = require('mongoose');

// Define the Variant schema
const variantTypeSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    type: {
        type: String,
        required: true,
        trim: true
    }
},{ timestamps: true });

// Create the Variant model
const VariantTypeModel = mongoose.model('VariantType', variantTypeSchema);

module.exports = VariantTypeModel;
