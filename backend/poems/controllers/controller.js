const pool = require('../../config/pg_db');

exports.getFilteredPoems = async (req, res) => {
    
    const {era, poet, genre, meter} = req.query;
    
    const conditions = [];
    const values = [];
    
    if (era) {
      values.push(era);
      conditions.push(`eras.name = $${values.length}`);
    }
    if (poet) {
      values.push(poet);
      conditions.push(`poets.name = $${values.length}`);
    }
    if (genre) {
      values.push(genre);
      conditions.push(`genres.name = $${values.length}`);
    }
    if (meter) {
      values.push(meter);
      conditions.push(`meters.name = $${values.length}`);
    }
    
    const whereClause = conditions.length ? `WHERE ${conditions.join(' AND ')}` : '';

    const query = `
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
    ORDER BY poems.id DESC
  `;

    try {
        const result = await pool.query(query, values);
        res.status(200).json({'poems': result.rows});
    } catch(err) {
        console.error('Error executing query: ', err);
        res.status(500).json({'error': 'Internal server error!'});
    }

};