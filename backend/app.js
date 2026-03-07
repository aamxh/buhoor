require('dotenv').config();
const express = require('express');
const app = express();
const mongoose = require('mongoose');
const authRoutes = require('./routes/auth_routes');
const poemsRoutes = require('./routes/poems_routes');
const poetsRoutes = require('./routes/poets_routes');
const searchRoutes = require('./routes/search_routes');

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