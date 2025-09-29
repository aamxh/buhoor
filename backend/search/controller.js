const pool = require('../config/pg_db');

async function search(req, res) {
  const { q } = req.query;

  if (!q) {
    return res.status(400).json({ error: 'Query parameter "q" is required.' });
  }

  const query = `
    WITH search AS (
  SELECT 
    'poems' AS type,
    json_build_object(
      'title', poems.title,
      'content', poems.content,
      'poet', poets.name,
      'era', eras.name,
      'genre', themes.name,
      'meter', meters.name
    ) AS result
  FROM poems
  JOIN poets ON poems.poet_id = poets.id
  JOIN eras ON poets.era_id = eras.id
  JOIN themes ON poems.theme_id = themes.id
  JOIN meters ON poems.meter_id = meters.id
  WHERE poems.title ILIKE $1 OR poems.content ILIKE $1

  UNION ALL

  SELECT 
    'poets' AS type,
    json_build_object(
      'name', poets.name,
      'bio', poets.bio,
      'era', eras.name,
      'slug', poets.slug
    ) AS result
  FROM poets
  JOIN eras ON poets.era_id = eras.id
  WHERE poets.name ILIKE $1 OR poets.slug::text ILIKE $1
)
SELECT json_agg(
  json_build_object(
    'type', type,
    'result', result
  )
) AS results
FROM search;
  `;

  try {
    const result = await pool.query(query, [`%${q}%`]);
    res.status(200).json(result.rows[0]); // return the JSON object, not array of rows
  } catch (err) {
    console.error('Error executing query:', err);
    res.status(500).json({ error: 'Internal server error!' });
  }
}

exports.search = search;