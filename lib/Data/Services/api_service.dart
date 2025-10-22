import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Buscar lista de tarefas
  static Future<List<Map<String, dynamic>>> getTasks() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/todos?_limit=10'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Falha ao carregar tarefas: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }

  // Buscar estatísticas do usuário
  static Future<Map<String, dynamic>> getUserStats() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/1'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        // Simular estatísticas baseadas nos dados do usuário
        return {
          'totalTasks': 25,
          'completedTasks': 18,
          'pendingTasks': 7,
          'totalEarnings': 2340.50,
          'userName': data['name'] ?? 'Bruno Silva',
          'userEmail': data['email'] ?? 'bruno@email.com',
        };
      } else {
        throw Exception('Falha ao carregar estatísticas: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }

  // Simular criação de nova tarefa
  static Future<Map<String, dynamic>> createTask(Map<String, dynamic> taskData) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/todos'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(taskData),
      );

      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Falha ao criar tarefa: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}