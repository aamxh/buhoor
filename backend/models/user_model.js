const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    username: {type: String, required: true, unique: true},
    password: {type: String, required: true, unique: false}
}, {timestamps: true});
const userModel = mongoose.model('User', userSchema);

module.exports = userModel;