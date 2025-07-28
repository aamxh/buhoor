const express = require('express');
const app = express();
const dotenv = require('dotenv');
const mongoose = require('mongoose');
const authRoutes = require('./auth/routes');
const pool = require('./db');

dotenv.config();
app.use(express.json());
app.use('/auth', authRoutes);
app.get('/poems', async (req, res) => {
    const result = await pool.query("SELECT * FROM poems LIMIT 10");
    res.json(result.rows);
});
// app.get('/', async (req, res) => {
//     const response = await fetch('https://api.qafiyah.com/poems/random');
//     const poem = await response.text();
//     console.log(poem);
//     res.send({poem});
// });
const port = process.env.PORT;

app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
});
mongoose.connect(process.env.MONGO_URI)
.then(() => console.log('Connected to MongoDB.'))
.catch(err => console.error(err));