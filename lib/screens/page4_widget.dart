import 'package:flutter/material.dart';

class Page4Widget extends StatelessWidget {
  const Page4Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Próximo de Você'),
        backgroundColor: const Color(0xFFA76D3E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Mapa ou Imagem Simulando Mapa
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Mapa de Localização',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Lista de Locais
            Expanded(
              child: ListView(
                children: [
                  _buildLocationItem(
                    title: 'Delegacia',
                    description: 'Rua Exemplo, 123 - Centro',
                  ),
                  _buildLocationItem(
                    title: 'ONG de Apoio',
                    description: 'Avenida da Paz, 456 - Bairro Feliz',
                  ),
                  _buildLocationItem(
                    title: 'Clínica de Emergência',
                    description: 'Rua Saúde, 789 - Bairro Saúde',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationItem({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        color: const Color(0xFFFDEBD2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        child: ListTile(
          leading: const Icon(
            Icons.location_on,
            color: Color(0xFFA76D3E),
            size: 40,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFFA76D3E),
            ),
          ),
          subtitle: Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
