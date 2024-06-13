const mongoose = require('mongoose');

//product schema
const productSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        trim: true
    },
    quantity: {
        type: Number,
        required: true
    },
    price: {
        type: Number,
        required: true
    },
    offerPrice: {
        type: Number
    },
    proCategoryId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'category',
        required: true
    },
    proSubCategoryId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'SubCategory',
        required: true
    },
    proBrandId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'brand'
    },
    proVariantTypeId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'VariantType'
    },
    proVariantId: [String],
    images: [{
        image: {
            type: Number,
            required: true
        },
        url: {
            type: String,
            required: true
        }
    }]
}, { timestamps: true });

//product model
const ProductModel = mongoose.model('Product', productSchema);

module.exports = ProductModel;
