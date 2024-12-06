import 'package:flutter/material.dart';
import '../services/api_service.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final ApiService apiService = ApiService();
  List<dynamic> users = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    setState(() {
      isLoading = true;
    });
    try {
      final data = await apiService.getUsers();
      setState(() {
        users = data;
      });
    } catch (e) {
      _showSnackBar('Erro ao buscar usuários: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> addUser() async {
    if (!_validateFields()) return;

    try {
      await apiService.createUser({
        'nome': nameController.text,
        'email': emailController.text,
        'senha': '123456', // Senha padrão
      });
      fetchUsers();
      _showSnackBar('Usuário adicionado com sucesso!');
      nameController.clear();
      emailController.clear();
    } catch (e) {
      _showSnackBar('Erro ao criar usuário: $e');
    }
  }

  Future<void> deleteUser(int userId) async {
    try {
      await apiService.deleteUser(userId);
      fetchUsers();
      _showSnackBar('Usuário removido com sucesso!');
    } catch (e) {
      _showSnackBar('Erro ao remover usuário: $e');
    }
  }

  bool _validateFields() {
    if (nameController.text.isEmpty || emailController.text.isEmpty) {
      _showSnackBar('Preencha todos os campos!');
      return false;
    }
    if (!_validateEmail(emailController.text)) {
      _showSnackBar('Digite um email válido!');
      return false;
    }
    return true;
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
      ),
      body: Column(
        children: [
          isLoading
              ? const Expanded(child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(user['nome']),
                        subtitle: Text(user['email']),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteUser(user['id']),
                        ),
                      );
                    },
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addUser,
                  child: const Text('Adicionar Usuário'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

