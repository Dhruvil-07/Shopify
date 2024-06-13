const mongoose = require('mongoose');

//poster Schema
const posterSchema = new mongoose.Schema({
  posterName: {
    type: String,
    required: true,
  },
  imageUrl: {
    type: String,
    required: true
  }
}, {
  timestamps: true,
});


//poster model
const PosterModel = mongoose.model('Poster', posterSchema);

module.exports = PosterModel;
