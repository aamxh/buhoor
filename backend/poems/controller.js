const pool = require('../config/pg_db');

async function getFilteredPoems(req, res) {
  
  const { era, poet, genre, meter, page, id } = req.query;

  const conditions = [];
  const values = [];

  if (id) {
    values.push(id);
    conditions.push(`poems.id = $${values.length}`);
  }
  if (era) {
    values.push(era);
    conditions.push(`eras.slug = $${values.length}`);
  }
  if (poet) {
    values.push(poet);
    conditions.push(`poets.slug = $${values.length}`);
  }
  if (genre) {
    values.push(genre);
    conditions.push(`themes.slug = $${values.length}`);
  }
  if (meter) {
    values.push(meter);
    conditions.push(`meters.slug = $${values.length}`);
  }

  const whereClause = conditions.length ? `WHERE ${conditions.join(' AND ')}` : '';

  let query;
  let paginationInfo = {};

  if (id) {
    // If id is specified, fetch only that poem (ignore pagination)
    query = `
      SELECT 
        poems.id,
        poems.title,
        poems.content,
        poets.name AS poet,
        eras.name AS era,
        themes.name AS genre,
        meters.name AS meter
      FROM poems
      JOIN poets ON poems.poet_id = poets.id
      JOIN eras ON poets.era_id = eras.id
      JOIN themes ON poems.theme_id = themes.id
      JOIN meters ON poems.meter_id = meters.id
      ${whereClause}
      LIMIT 1
    `;
  } else {
    // Otherwise, apply pagination
    const pageSize = 20;
    const currentPage = parseInt(page, 10) || 1;
    const offset = (currentPage - 1) * pageSize;

    values.push(pageSize, offset);

    query = `
      SELECT 
        poems.id,
        poems.title,
        poems.content,
        poets.name AS poet,
        eras.name AS era,
        themes.name AS genre,
        meters.name AS meter
      FROM poems
      JOIN poets ON poems.poet_id = poets.id
      JOIN eras ON poets.era_id = eras.id
      JOIN themes ON poems.theme_id = themes.id
      JOIN meters ON poems.meter_id = meters.id
      ${whereClause}
      ORDER BY poems.id ASC
      LIMIT $${values.length - 1} OFFSET $${values.length}
    `;

    paginationInfo = { page: currentPage, pageSize };
  }

  try {
    const result = await pool.query(query, values);
    res.status(200).json({
      poems: result.rows,
      ...paginationInfo,
    });
  } catch (err) {
    console.error('Error executing query: ', err);
    res.status(500).json({ error: 'Internal server error!' });
  }
  
}

exports.getFilteredPoems = getFilteredPoems;