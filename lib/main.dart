import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 100), // Substitua pela logo do Renova
            SizedBox(height: 20),
            Text(
              'Bem-vindo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'O Renova é uma plataforma integrada que oferece suporte, acompanhamento e reabilitação para agressores de violência doméstica.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Aqui vai a navegação para o próximo passo
              },
              child: Text('Continuar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
