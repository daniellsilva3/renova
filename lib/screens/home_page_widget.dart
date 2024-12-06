import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            // Logo do Renova
            Center(
              child: Image.asset(
                'assets/renova.png',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            // Texto de boas-vindas
            const Text(
              'Bem-vindo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 20),
            // Descrição
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'O Renova é uma plataforma integrada que oferece suporte, '
                'acompanhamento e reabilitação para agressores de violência doméstica.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.brown,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Imagens adicionais
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/perigo.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/2cab.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/human.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Botões
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'Page1'); // Navegar para Page1
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA76D3E), // Cor do botão
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Continuar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'UserScreen'); // Navegar para UserScreen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFA76D3E), // Cor do botão
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Cadastrar Usuário',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
