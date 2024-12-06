const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const pool = require('./config'); // Conexão com o banco de dados

const app = express();

app.use(cors());
app.use(bodyParser.json());

// Rota para listar avaliações por usuário
app.get('/avaliacoes/:usuarioId', async (req, res) => {
  const { usuarioId } = req.params;
  try {
    const result = await pool.query(
      'SELECT * FROM avaliacoes WHERE usuario_id = $1',
      [usuarioId]
    );
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Rota para criar uma avaliação
app.post('/avaliacoes', async (req, res) => {
  const { usuario_id, status, descricao } = req.body;
  try {
    const result = await pool.query(
      'INSERT INTO avaliacoes (usuario_id, status, descricao) VALUES ($1, $2, $3) RETURNING *',
      [usuario_id, status, descricao]
    );
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Rota para listar compromissos por usuário
app.get('/compromissos/:usuarioId', async (req, res) => {
  const { usuarioId } = req.params;
  try {
    const result = await pool.query(
      'SELECT * FROM compromissos WHERE usuario_id = $1',
      [usuarioId]
    );
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Rota para criar um compromisso
app.post('/compromissos', async (req, res) => {
  const { usuario_id, data, descricao } = req.body;
  try {
    const result = await pool.query(
      'INSERT INTO compromissos (usuario_id, data, descricao) VALUES ($1, $2, $3) RETURNING *',
      [usuario_id, data, descricao]
    );
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Rota para listar sessões por usuário
app.get('/sessoes/:usuarioId', async (req, res) => {
  const { usuarioId } = req.params;
  try {
    const result = await pool.query(
      'SELECT * FROM sessoes WHERE usuario_id = $1',
      [usuarioId]
    );
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Rota para criar uma sessão
app.post('/sessoes', async (req, res) => {
  const { usuario_id, data, observacoes } = req.body;
  try {
    const result = await pool.query(
      'INSERT INTO sessoes (usuario_id, data, observacoes) VALUES ($1, $2, $3) RETURNING *',
      [usuario_id, data, observacoes]
    );
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Inicia o servidor
app.listen(3000, () => {
  console.log('Servidor rodando na porta 3000');
});
