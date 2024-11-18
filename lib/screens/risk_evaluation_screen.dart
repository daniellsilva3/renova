import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RiskEvaluationScreen extends StatelessWidget {
  final int userId;

  RiskEvaluationScreen({required this.userId});

  Future<Map<String, dynamic>> fetchEvaluation(int userId) async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/avaliacao-risco/$userId'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erro ao carregar dados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: Text('Renova'),
        backgroundColor: Colors.brown,
      ),
      body: FutureBuilder(
        future: fetchEvaluation(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else {
            final data = snapshot.data as Map<String, dynamic>;
            final usuario = data['usuario'];
            final avaliacao = data['avaliacao'];

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Substitua pela URL real
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${usuario["nome"]}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Avaliação de Risco',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown.shade800,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${avaliacao["status"]}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green.shade700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '${avaliacao["descricao"]}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.brown.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.question_mark),
                        color: Colors.brown,
                        iconSize: 30,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.tablet),
                        color: Colors.brown,
                        iconSize: 30,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.chat_bubble),
                        color: Colors.brown,
                        iconSize: 30,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.person),
                        color: Colors.brown,
                        iconSize: 30,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
