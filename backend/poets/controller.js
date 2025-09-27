const pool = require('../config/pg_db');

async function getPoets(req, res) {

    const page = parseInt(req.query.page) || 1;
    const query = `
    SELECT *
    FROM poets
    ORDER BY name ASC
    LIMIT 20
    OFFSET $1
    `;

    try {
        const result = await pool.query(
            query,
            [(page - 1) * 20]);
        res.status(200).json({poets: result.rows, page: page});
    } catch(err) {
        console.log("Internal server error!", err);
        res.status(500).json({error: "Internal server error!"});
    }
}

exports.getPoets = getPoets;