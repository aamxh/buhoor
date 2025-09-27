const pool = require('../config/pg_db');

async function getPoets(req, res) {
  
  const page = parseInt(req.query.page, 10) || 1;
  const id = req.query.id;

  let query;
  let values = [];
  let paginationInfo = {};

  if (id) {
    // Fetch single poet by id (ignore pagination)
    query = `
      SELECT poets.id, poets.name, eras.name AS era, poets.bio
      FROM poets
      JOIN eras ON poets.era_id = eras.id
      WHERE poets.id = $1
      LIMIT 1
    `;
    values = [id];
  } else {
    // Fetch page of poets
    const offset = (page - 1) * 20;
    query = `
      SELECT poets.id, poets.name, eras.name AS era, poets.bio
      FROM poets
      JOIN eras ON poets.era_id = eras.id
      ORDER BY poets.name ASC
      LIMIT 20
      OFFSET $1
    `;
    values = [offset];
    paginationInfo = { page };
  }

  try {
    const result = await pool.query(query, values);
    res.status(200).json({
      poets: result.rows,
      ...paginationInfo,
    });
  } catch (err) {
    console.error("Internal server error!", err);
    res.status(500).json({ error: "Internal server error!" });
  }
}

exports.getPoets = getPoets;