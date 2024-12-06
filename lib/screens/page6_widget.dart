import 'package:flutter/material.dart';

class Page6Widget extends StatelessWidget {
  const Page6Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA76D3E),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Theme.of(context).primaryColor,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Informações do Usuário',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Nome: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'João da Silva',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'CPF: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '123.456.789-09',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

