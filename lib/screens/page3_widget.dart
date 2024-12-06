import 'package:flutter/material.dart';

class Page3Widget extends StatelessWidget {
  const Page3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        backgroundColor: const Color(0xFFA76D3E),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFaqItem(
            question: '1. O que é o aplicativo e como ele funciona?',
            answer: 'O aplicativo Renova oferece suporte para reabilitação e acompanhamento de agressores de violência doméstica.',
          ),
          _buildFaqItem(
            question: '2. O aplicativo é realmente gratuito?',
            answer: 'Sim, o aplicativo é gratuito para todos os usuários.',
          ),
          _buildFaqItem(
            question: '3. Como o aplicativo pode me ajudar com minha saúde mental?',
            answer: 'O Renova fornece sessões de acompanhamento e atividades para ajudar na mudança de comportamento.',
          ),
          _buildFaqItem(
            question: '4. Preciso ter experiência anterior com meditação ou outras práticas?',
            answer: 'Não, o aplicativo é projetado para iniciantes e profissionais.',
          ),
          _buildFaqItem(
            question: '5. Como meus dados pessoais são protegidos?',
            answer: 'Seus dados são protegidos por criptografia e respeitamos as regulamentações de proteção de dados.',
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem({required String question, required String answer}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        color: const Color(0xFFFDEBD2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFFA76D3E),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                answer,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
