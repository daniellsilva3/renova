const express = require('express');
const bodyParser = require('body-parser');
const { createUser, getAllUsers } = require('./controllers/userController');
const { getEvaluationByUserId } = require('./controllers/evaluationController');

const app = express();
app.use(bodyParser.json());

// Rotas de usuários
app.post('/usuarios', createUser);
app.get('/usuarios', getAllUsers);

// Rotas de avaliações
app.get('/avaliacao-risco/:usuarioId', getEvaluationByUserId);

// Inicialização do servidor
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
