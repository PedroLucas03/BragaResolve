# GRUPO 2 - API Integration e Backend

## 🎯 Objetivo
Integrar uma API REST na tela de Resumo (ResumePage) para exibir dados dinâmicos

## 📋 Tarefas
1. Criar serviço para consumir API de tarefas
2. Implementar estados de loading e erro
3. Exibir dados dinâmicos na tela de resumo
4. Adicionar refresh para recarregar dados

## 📁 Arquivos a serem criados/modificados

### 1. Criar serviço de API
**Caminho:** `lib/Data/Services/api_service.dart`

```dart
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
```

### 2. Modificar ResumePage
**Caminho:** `lib/Presentation/Screens/resumePage.dart`

```dart
import 'package:flutter/material.dart';
import '../../Data/Services/api_service.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  bool _isLoading = true;
  String? _error;
  List<Map<String, dynamic>> _tasks = [];
  Map<String, dynamic>? _userStats;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Carregar dados em paralelo
      final futures = await Future.wait([
        ApiService.getTasks(),
        ApiService.getUserStats(),
      ]);

      setState(() {
        _tasks = futures[0] as List<Map<String, dynamic>>;
        _userStats = futures[1] as Map<String, dynamic>;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Carregando dados...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Erro ao carregar dados',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _error!,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadData,
              child: const Text('Tentar Novamente'),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatsCards(),
          const SizedBox(height: 24),
          _buildTasksSection(),
        ],
      ),
    );
  }

  Widget _buildStatsCards() {
    if (_userStats == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Resumo do Mês',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Tarefas Totais',
                _userStats!['totalTasks'].toString(),
                Icons.assignment,
                Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'Concluídas',
                _userStats!['completedTasks'].toString(),
                Icons.check_circle,
                Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                'Pendentes',
                _userStats!['pendingTasks'].toString(),
                Icons.pending,
                Colors.orange,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                'Faturamento',
                'R\$ ${_userStats!['totalEarnings'].toStringAsFixed(2)}',
                Icons.attach_money,
                Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTasksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Últimas Tarefas',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _tasks.length,
          itemBuilder: (context, index) {
            final task = _tasks[index];
            return _buildTaskCard(task);
          },
        ),
      ],
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> task) {
    final isCompleted = task['completed'] ?? false;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? Colors.green : Colors.grey,
        ),
        title: Text(
          task['title'] ?? 'Sem título',
          style: TextStyle(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
            color: isCompleted ? Colors.grey[600] : null,
          ),
        ),
        subtitle: Text('ID: ${task['id']}'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isCompleted ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            isCompleted ? 'Concluída' : 'Pendente',
            style: TextStyle(
              fontSize: 12,
              color: isCompleted ? Colors.green : Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
```

## 📦 Dependência necessária
Adicionar no `pubspec.yaml`:
```yaml
dependencies:
  http: ^1.1.0
```

## 🚀 Como implementar
1. Executar `flutter pub get` para instalar a dependência http
2. Criar o arquivo `api_service.dart` na pasta `lib/Data/Services/`
3. Substituir o conteúdo do arquivo `resumePage.dart`
4. Testar a conexão com a API

## ✅ Funcionalidades implementadas
- ✅ Consumo de API REST (JSONPlaceholder)
- ✅ Estados de loading, erro e sucesso
- ✅ Pull-to-refresh para recarregar dados
- ✅ Tratamento de erros de conexão
- ✅ Interface responsiva com cards de estatísticas
- ✅ Lista dinâmica de tarefas

## 🧪 Como testar
1. Execute o app e vá para a aba "Resumo"
2. Observe o loading inicial
3. Teste o pull-to-refresh puxando a tela para baixo
4. Simule erro desconectando a internet

## 🔧 Possíveis melhorias
- Implementar cache local
- Adicionar paginação
- Criar interceptors para autenticação
- Implementar retry automático