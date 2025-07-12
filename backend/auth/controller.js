const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const User = require('./models/user');

async function register(req, res) {
    const {username, password} = req.body;
    try {
        const exists = await User.findOne({username});
        if (exists) return res.status(400).json({message: 'User already exists!'});
        const hashedPassword = await bcrypt.hash(password, 10);
        const user = new User({username: username, password: hashedPassword});
        await user.save();
        const token = jwt.sign({id: user.id, username: user.username, iat: Date.now()}, process.env.JWT_KEY, {expiresIn: '3d'});
        res.status(201).json({message: `User registered.`, jwt: token});
    } catch(err) {
        res.status(500).json({message: 'Server error!'});
    }
}

async function login(req, res) {
    const {username, password} = req.body;
    try {
        const user = await User.findOne({username})
        if (!user) return res.status(400).json({message: "Invalid credentials!"});
        const match = await bcrypt.compare(password, user.password);
        if (!match) return res.status(400).json({message: "Invalid credentials!"});
        const token = jwt.sign({id: user.id, username: user.username, iat: Date.now()}, process.env.JWT_KEY, {expiresIn: '3d'});
        res.json({"jwt": token});
    } catch(err) {
        res.status(500).json({message: err});
    }
}

exports.register = register;

exports.login = login;

exports.profile = (req, res) => {
    res.json({message: `Hello ${req.user.username}`});
};