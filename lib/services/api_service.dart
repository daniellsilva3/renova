import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:3000/api'; // URL do backend
  Future<List<dynamic>> getPage7Items() async {
    final response = await http.get(Uri.parse('$baseUrl/page7items'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Retorna os itens como lista de mapas
    } else {
      throw Exception('Erro ao buscar itens da Page7: ${response.statusCode}');
    }
  }
  // Busca todos os usuários
  Future<List<dynamic>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Retorna a lista de usuários
    } else {
      throw Exception('Erro ao buscar usuários: ${response.statusCode}');
    }
  }

  // Cria um novo usuário
  Future<void> createUser(Map<String, String> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode != 201) {
      throw Exception('Erro ao criar usuário: ${response.statusCode}');
    }
  }

  // Deleta um usuário pelo ID
  Future<void> deleteUser(int userId) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$userId'));

    if (response.statusCode != 200) {
      throw Exception('Erro ao deletar usuário: ${response.statusCode}');
    }
  }
}

