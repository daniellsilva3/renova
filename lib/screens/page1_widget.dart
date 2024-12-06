import 'package:flutter/material.dart';

class Page1Widget extends StatelessWidget {
  const Page1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliação de Risco'),
        backgroundColor: const Color(0xFFA76D3E),
        actions: [
          IconButton(
            icon: const Icon(Icons.insert_drive_file), // Ícone de arquivo
            onPressed: () {
              Navigator.pushNamed(context, 'Page2'); // Navegar para Page2
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Foto do Usuário com Contorno
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFA76D3E),
                  width: 8,
                ),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/renova-6gbae8/assets/aukexqfpzp8b/homem.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Avaliação de Risco
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFA76D3E),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Avaliação de Risco',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Baixo Risco: Você está mostrando sinais consistentes de mudança positiva, com poucas chances de reincidência de comportamentos violentos.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Botões de Ação
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconButton(Icons.question_mark, context, 'Page3'),
              _buildIconButton(Icons.gps_fixed, context, 'Page4'),
              _buildIconButton(Icons.message_outlined, context, 'Page7'),
              _buildIconButton(Icons.person, context, 'Page6'),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, BuildContext context, String route) {
    return IconButton(
      icon: Icon(icon, size: 50, color: const Color(0xFFA76D3E)),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
