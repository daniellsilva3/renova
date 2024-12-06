const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
require('dotenv').config();

const userRoutes = require('./routes/userRoutes');
const evolutionRoutes = require('./routes/evaluationRoutes');

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(cors());
app.use(bodyParser.json());

app.get('/api/page7items', (req, res) => {
  res.json([
    { text: "Avaliação de Risco", route: "Page8", icon: 58820 },
    { text: "Sessões", route: "Page9", icon: 59530 },
    { text: "Relatórios", route: "Page10", icon: 57854 }
  ]);
});
app.get('/api/page8sessions', (req, res) => {
  res.json([
    {
      sessionId: 1,
      patientName: "João da Silva",
      date: "05/10/2024",
      psychologist: "Dra. Camila Rodrigues",
      description:
        "João se mostrou inicialmente fechado e relutante ao compartilhar suas experiências. No entanto, após alguns minutos de conversa, ele começou a expressar sua frustração com as pressões familiares e dificuldades financeiras, que segundo ele, contribuíram para seu comportamento agressivo. João relatou um histórico de explosões de raiva, especialmente em momentos de estresse, mas evitou reconhecer a gravidade de seus atos. Durante a sessão, a psicóloga tentou ajudá-lo a identificar os gatilhos que o levam à agressividade e a criar uma maior consciência sobre suas emoções.\n\nObservações da Psicóloga: João demonstrou certa dificuldade em assumir responsabilidade total sobre seus atos, mas apresentou sinais de abertura para mudança ao final da sessão.",
    },
    {
      sessionId: 2,
      patientName: "João da Silva",
      date: "15/09/2024",
      psychologist: "Dra. Camila Rodrigues",
      description:
        "Na sessão de hoje, João apresentou-se mais receptivo em comparação às consultas anteriores. Ele relatou que está fazendo esforço consciente para evitar explosões de raiva, principalmente nos momentos em que se sente mais pressionado. No entanto, ele ainda demonstra dificuldade em manter a calma em situações familiares tensas, especialmente com a ex-companheira, o que tem gerado sentimentos de frustração e impotência. Durante a sessão, a psicóloga explorou relações entre o comportamento de João e os gatilhos emocionais identificados, buscando formas de ajudá-lo a lidar melhor com essas situações.",
    },
  ]);
});
app.get('/api/page9reports', (req, res) => {
  res.json([
    {
      reportId: 1,
      caso: "Processo de Violência Doméstica",
      patientName: "João da Silva",
      reportDate: "15/10/2024",
      psychologist: "Dr. Carlos Oliveira:",
      process: " 123456789",
      summary: "Afastamento da Vítima: João está sujeito a uma ordem de afastamento da vítima, devendo manter uma distância mínima de 500 metros dela. Essa medida tem o intuito de garantir a segurança da vítima.\nAudiências Periódicas: João deverá comparecer a todas as audiências agendadas pelo juiz responsável pelo caso.",
    },
    {
      reportId: 2,
      caso: "Processo de Violência Doméstica",
      patientName: "João da Silva",
      reportDate: "15/09/2024",
      psychologist: "Dra. Ana Souza",
      process: " 123456789",
      summary: "Afastamento da Vítima:\nJoão está sujeito a uma ordem de afastamento emitida em 12/06/2024, devendo manter uma distância mínima de 400 metros da vítima. A medida também se aplica aos locais de trabalho e estudo da vítima.\n\nUso de Tornozeleira Eletrônica:\nDesde 01/07/2024, João foi obrigado a usar tornozeleira eletrônica para monitoramento de sua localização, garantindo o cumprimento da medida protetiva de afastamento.",
    },
  ]);
});

app.get('/api/page10reports', (req, res) => {
  res.json([
    {
      reportId: 1,
      patientName: "João da Silva",
      reportDate: "05/10/2024",
      psychologist: "Maria Oliveira",
      summary: "Descrição da Situação na Assistência Social:\nJoão foi encaminhado ao serviço de assistência social como parte do processo de reabilitação ordenado pelo tribunal. O objetivo do acompanhamento é fornecer suporte e orientação, ajudando-o a lidar com suas dificuldades emocionais e sociais. Durante a última sessão, foram abordados os seguintes pontos:  \n\n1. Avaliação das Condições Sociais: João relatou que atualmente trabalha como autônomo, o que lhe proporciona flexibilidade, mas gera instabilidade financeira.  \n2. Apoio em Situações de Conflito: Foram discutidas estratégias para lidar com situações de tensão em ambientes familiares e sociais.  \n3. Orientação para Recursos Disponíveis: João foi orientado a buscar programas de apoio financeiro e psicológico oferecidos pela comunidade.",
    },
    {
      reportId: 2,
      patientName: "João da Silva",
      reportDate: "15/09/2024",
      psychologist: "Maria Autunes",
      summary: "Durante o acompanhamento, João se mostrou mais aberto a discutir suas dificuldades, principalmente em relação à sua reintegração social. Ele expressou preocupações sobre o impacto que as medidas restritivas têm em sua vida pessoal e profissional, especialmente sobre as limitações de contato com seus filhos. João relatou ter buscado maneiras de melhorar seu comportamento e mencionou que começou a praticar atividades físicas regulares para lidar com o estresse. No entanto, ele também revelou dificuldades em encontrar estabilidade financeira, o que tem causado frustração e o deixado emocionalmente vulnerável.",
    },
  ]);
});
app.get('/api/activities', (req, res) => {
  res.json([
    {
      id: 1,
      title: 'Consulta com Psicólogo',
      date: '15 de Outubro de 2024',
      time: '14:00 - 15:00',
      location: 'Consultório da Psicóloga Márcia Silva',
      imageUrl:
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/renova-6gbae8/assets/41vrbwbhdojh/cinematic-portrait-woman-working-healthcare-system-having-care-job.jpg',
    },
    {
      id: 2,
      title: 'Reunião com Assistente Social',
      date: '25 de Outubro de 2024',
      time: '16:00 - 17:00',
      location: 'Escritório de Ana Paula',
      imageUrl:
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/renova-6gbae8/assets/41vrbwbhdojh/cinematic-portrait-woman-working-healthcare-system-having-care-job.jpg',
    },
    {
      id: 3,
      title: 'Participação em Ação Social',
      date: '20 de Outubro de 2024',
      time: '09:00 - 12:00',
      location: 'Centro Comunitário da Cidade',
      imageUrl:
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/renova-6gbae8/assets/41vrbwbhdojh/cinematic-portrait-woman-working-healthcare-system-having-care-job.jpg',
    },
  ]);
});


// Rotas
app.use('/api/users', userRoutes);
app.use('/api/evolutions', evolutionRoutes);

// Inicialização do servidor
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});

