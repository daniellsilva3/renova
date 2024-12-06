const evolutionModel = require('../models/evaluationModel');

// Lista todas as evoluções
const getEvolutions = async (req, res) => {
  try {
    const evolutions = await evolutionModel.findAll();
    res.json(evolutions);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Cria uma nova evolução
const createEvolution = async (req, res) => {
  const { usuarioId, descricao, data } = req.body;
  try {
    const evolution = await evolutionModel.create(usuarioId, descricao, data);
    res.json(evolution);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

module.exports = {
  getEvolutions,
  createEvolution,
};
