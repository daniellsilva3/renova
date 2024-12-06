import 'package:flutter/material.dart';
import '../services/api_service.dart';

class Page7Widget extends StatefulWidget {
  const Page7Widget({super.key});

  @override
  State<Page7Widget> createState() => _Page7WidgetState();
}

class _Page7WidgetState extends State<Page7Widget> {
  final ApiService apiService = ApiService();
  List<dynamic> items = []; // Lista de itens carregados do backend
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    setState(() {
      isLoading = true;
    });
    try {
      final data = await apiService.getPage7Items(); // Endpoint para carregar itens
      setState(() {
        items = data;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar itens: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 7'),
        backgroundColor: const Color(0xFFA76D3E),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, item['route']);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.brown[50],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          IconData(item['icon'], fontFamily: 'MaterialIcons'),
                          size: 40, // Reduz o tamanho do ícone
                          color: const Color(0xFFA76D3E),
                        ),
                        const SizedBox(height: 8), // Espaço menor entre ícone e texto
                        Text(
                          item['text'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14, // Fonte menor para o texto
                            fontWeight: FontWeight.bold,
                            color: Colors.brown[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
