const pool = require('../config/db');

// Função para buscar todas as evoluções
const findAll = async () => {
  const result = await pool.query('SELECT * FROM evolutions');
  return result.rows;
};

// Função para criar uma nova evolução
const create = async (usuarioId, descricao, data) => {
  const result = await pool.query(
    'INSERT INTO evolutions (usuario_id, descricao, data) VALUES ($1, $2, $3) RETURNING *',
    [usuarioId, descricao, data]
  );
  return result.rows[0];
};

module.exports = {
  findAll,
  create,
};
