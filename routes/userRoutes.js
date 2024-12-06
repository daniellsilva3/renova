const express = require('express');
const router = express.Router();
const { getUsers, createUser, deleteUser } = require('../controllers/userController');

// Rotas para usuários
router.get('/', getUsers); // Lista usuários
router.post('/', createUser); // Cria um novo usuário
router.delete('/:id', deleteUser); // Deleta um usuário pelo ID

module.exports = router;