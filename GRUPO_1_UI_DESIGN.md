# GRUPO 1 - UI/UX Design e Implementação

## 🎯 Objetivo
Criar o design no Figma e implementar a interface da tela de Orçamentos (BudgetPage)

## 📋 Tarefas

### Parte 1: Design no Figma (30 min)
1. Criar um mockup da tela de orçamentos com:
   - Header com título "Meus Orçamentos"
   - Lista de cards de orçamentos
   - Botão flutuante para adicionar novo orçamento
   - Cada card deve mostrar: título, valor, status, data

### Parte 2: Implementação no Flutter (60-90 min)
2. Substituir o conteúdo da `BudgetPage` pelo código abaixo
3. Personalizar cores e estilos conforme o design criado

## 📁 Arquivo a ser modificado
**Caminho:** `lib/Presentation/Screens/budgetPage.dart`

## 💻 Código para implementar

```dart
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  // Lista mockada de orçamentos
  final List<Map<String, dynamic>> budgets = [
    {
      'id': 1,
      'title': 'Instalação Elétrica',
      'value': 850.00,
      'status': 'Pendente',
      'date': '22/10/2024',
      'description': 'Instalação completa de pontos elétricos'
    },
    {
      'id': 2,
      'title': 'Reparo Hidráulico',
      'value': 320.00,
      'status': 'Aprovado',
      'date': '20/10/2024',
      'description': 'Conserto de vazamento na cozinha'
    },
    {
      'id': 3,
      'title': 'Pintura Externa',
      'value': 1200.00,
      'status': 'Em Análise',
      'date': '18/10/2024',
      'description': 'Pintura da fachada do imóvel'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meus Orçamentos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: budgets.length,
                itemBuilder: (context, index) {
                  final budget = budgets[index];
                  return _buildBudgetCard(budget);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddBudgetDialog();
        },
        backgroundColor: const Color(0xFFF9DC06),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget _buildBudgetCard(Map<String, dynamic> budget) {
    Color statusColor;
    switch (budget['status']) {
      case 'Aprovado':
        statusColor = Colors.green;
        break;
      case 'Pendente':
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.blue;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    budget['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    budget['status'],
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              budget['description'],
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'R\$ ${budget['value'].toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  budget['date'],
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAddBudgetDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Novo Orçamento'),
          content: const Text('Funcionalidade em desenvolvimento...'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
```

## 🎨 Dicas de Personalização
- Altere as cores dos cards e status conforme seu design
- Adicione ícones personalizados
- Implemente animações nos cards
- Customize o botão flutuante

## ✅ Critérios de Avaliação
- Design criativo e funcional no Figma
- Implementação fiel ao design
- Código limpo e organizado
- Interface responsiva

## 📱 Como testar
1. Substitua o conteúdo do arquivo `budgetPage.dart`
2. Execute o app e navegue até a aba "Orçamentos"
3. Teste a rolagem da lista e o botão de adicionar