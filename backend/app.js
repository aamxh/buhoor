require('dotenv').config();
const express = require('express');
const app = express();
const mongoose = require('mongoose');
const authRoutes = require('./auth/routes');
const poemsRoutes = require('./poems/routes');
const poetsRoutes = require('./poets/routes');
const searchRoutes = require('./search/routes');

app.use(express.json());
app.use('/auth', authRoutes);
app.use('/poems', poemsRoutes);
app.use('/poets', poetsRoutes);
app.use('/search', searchRoutes);
const port = process.env.PORT || 3000;

app.listen(port, '0.0.0.0' ,() => {
    console.log(`Server listening on: ${port}`);
});
mongoose.connect(process.env.MONGO_URI)
.then(() => console.log('Connected to MongoDB.'))
.catch(err => console.error(err));