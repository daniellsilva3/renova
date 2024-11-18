import 'package:flutter/material.dart';
import 'risk_evaluation_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Image.asset(
              'assets/logo.png', // Substitua pela logo do Renova
              height: 100,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Bem-vindo',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.brown.shade800,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'O Renova é uma plataforma integrada que oferece suporte, acompanhamento e reabilitação para agressores de violência doméstica.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown.shade600,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RiskEvaluationScreen(userId: 1),
                  ),
                );
              },
              child: Text('Continuar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
