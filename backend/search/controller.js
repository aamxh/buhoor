const pool = require('../config/pg_db');

async function search(req, res) {
    
    const {q} = req.query;
    
    if (!q) {
        return res.status(400).json({error: 'Query parameter "q" is required.'});
    }
    
    query = `
    WITH search AS (
  SELECT 
    'poems' AS type,
    json_build_object(
      'id', poems.id,
      'title', poems.title,
      'content', poems.content
    ) AS result
  FROM poems
  WHERE poems.title ILIKE $1 OR poems.content ILIKE $1

  UNION ALL

  SELECT 
    'poets' AS type,
    json_build_object(
      'id', poets.id,
      'name', poets.name,
      'era', eras.name
    ) AS result
  FROM poets
  JOIN eras ON poets.era_id = eras.id
  WHERE poets.name ILIKE $1

  UNION ALL

  SELECT 
    'genres' AS type,
    json_build_object(
      'id', themes.id,
      'name', themes.name
    ) AS result
  FROM themes
  WHERE themes.name ILIKE $1

  UNION ALL

  SELECT 
    'eras' AS type,
    json_build_object(
      'id', eras.id,
      'name', eras.name
    ) AS result
  FROM eras
  WHERE eras.name ILIKE $1

  UNION ALL

  SELECT 
    'meters' AS type,
    json_build_object(
      'id', meters.id,
      'name', meters.name
    ) AS result
  FROM meters
  WHERE meters.name ILIKE $1
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
        res.status(200).json(result.rows);
    } catch(err) {
        console.error('Error executing query:', err);
        res.status(500).json({error: 'Internal server error!'});
    }

}

exports.search = search;