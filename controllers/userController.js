const pool = require('../db/db');

// Criação de um novo usuário
const createUser = async (req, res) => {
  const { nome, email, senha, tipo } = req.body;
  try {
    const result = await pool.query(
      'INSERT INTO usuarios (nome, email, senha, tipo) VALUES ($1, $2, $3, $4) RETURNING *',
      [nome, email, senha, tipo]
    );
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

// Listagem de todos os usuários
const getAllUsers = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM usuarios');
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = {
  createUser,
  getAllUsers,
};
