const pool = require('../db/db');

// Obter avaliação por usuário
const getEvaluationByUserId = async (req, res) => {
  const { usuarioId } = req.params;
  try {
    // Busque o usuário
    const userResult = await pool.query('SELECT * FROM usuarios WHERE id = $1', [usuarioId]);
    if (userResult.rows.length === 0) {
      return res.status(404).json({ error: 'Usuário não encontrado' });
    }

    // Busque a avaliação associada
    const evaluationResult = await pool.query(
      'SELECT * FROM avaliacoes WHERE usuario_id = $1',
      [usuarioId]
    );

    if (evaluationResult.rows.length === 0) {
      return res.status(404).json({ error: 'Avaliação não encontrada' });
    }

    res.json({
      usuario: userResult.rows[0],
      avaliacao: evaluationResult.rows[0],
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = {
  getEvaluationByUserId,
};
