const mongoose = require('mongoose');

//coupon code schema
const couponSchema = new mongoose.Schema({
  couponCode: {
    type: String,
    required: true,
    unique: true
  },
  discountType: {
    type: String,
    enum: ['fixed', 'percentage'],
    required: true
  },
  discountAmount: {
    type: Number,
    required: true
  },
  minimumPurchaseAmount: {
    type: Number,
    required: true
  },
  endDate: {
    type: String,
    required: true
  },
  status: {
    type: String,
    enum: ['active', 'inactive'],
    default: 'active'
  },
  applicableCategory: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'category'
  },
  applicableSubCategory: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'SubCategory'
  },
  applicableProduct: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Product'
  }
}, { timestamps: true });

//coupon model
const CouponModel = mongoose.model('Coupon', couponSchema);

module.exports = CouponModel;
