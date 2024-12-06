const userModel = require('../models/userModel');
const pool = require('../config/db');

const getUsers = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM usuarios');
    res.json(result.rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const createUser = async (req, res) => {
  const { nome, email, senha } = req.body;
  try {
    const result = await pool.query(
      'INSERT INTO usuarios (nome, email, senha) VALUES ($1, $2, $3) RETURNING *',
      [nome, email, senha]
    );
    res.json(result.rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

const deleteUser = async (req, res) => {
  const { id } = req.params;
  try {
    const result = await pool.query('DELETE FROM usuarios WHERE id = $1 RETURNING *', [id]);
    if (result.rowCount === 0) {
      return res.status(404).json({ error: 'Usuário não encontrado' });
    }
    res.json({ message: 'Usuário removido com sucesso!' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = {
  getUsers,
  createUser,
  deleteUser, // Certifique-se de exportar a função aqui
};

