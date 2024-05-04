const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const OtherSchema = new Schema({
  animal_name: { type: String, required: true },
  age: { type: Number, required: true },
  breed: { type: String, required: true },
  color: { type: String, required: true },
  gender: { type: String, required: true },
  size: { type: String, required: true },
  description: { type: String, required: true },
  adoption_fee: { type: String, required: true },
  location: { type: String, required: true },
  image_url: { type: String, required: true }
});

const OthersModel = mongoose.model('Other', OtherSchema);

module.exports = OthersModel;
