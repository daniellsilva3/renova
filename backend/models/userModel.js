const pool = require('../config/db');

// Função para buscar todos os usuários
const findAll = async () => {
  const result = await pool.query('SELECT * FROM usuarios');
  return result.rows;
};

// Função para criar um novo usuário
const create = async (nome, email, senha) => {
  const result = await pool.query(
    'INSERT INTO usuarios (nome, email, senha) VALUES ($1, $2, $3) RETURNING *',
    [nome, email, senha]
  );
  return result.rows[0];
};

module.exports = {
  findAll,
  create,
};
