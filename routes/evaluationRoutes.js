const express = require('express');
const router = express.Router();
const { getEvolutions, createEvolution } = require('../controllers/evaluationController');

// Rotas para evoluções
router.get('/', getEvolutions); // Lista evoluções
router.post('/', createEvolution); // Cria uma nova evolução

module.exports = router;
