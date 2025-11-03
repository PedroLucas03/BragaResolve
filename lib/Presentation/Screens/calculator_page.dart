import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _materialController = TextEditingController();
  final TextEditingController _laborController = TextEditingController();
  final TextEditingController _extraController = TextEditingController();

  double _total = 0.0;
  double _profit = 0.2;

  void _calculateTotal() {
    final material = double.tryParse(_materialController.text) ?? 0;
    final labor = double.tryParse(_laborController.text) ?? 0;
    final extra = double.tryParse(_extraController.text) ?? 0;

    final subtotal = material + labor + extra;
    setState(() {
      _total = subtotal * (1 + _profit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Orçamento'),
        backgroundColor: const Color(0xFFF9DC06),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Calcule seu orçamento',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            TextField(
              controller: _materialController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Custo do Material (R\$)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.build),
              ),
              onChanged: (_) => _calculateTotal(),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _laborController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Mão de Obra (R\$)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_2),
              ),
              onChanged: (_) => _calculateTotal(),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _extraController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Custos Extras (R\$)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.add_circle_outline),
              ),
              onChanged: (_) => _calculateTotal(),
            ),
            const SizedBox(height: 24),

            Text('Margem de Lucro: ${(_profit * 100).toInt()}%'),
            Slider(
              value: _profit,
              min: 0.0,
              max: 0.5,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  _profit = value;
                });
                _calculateTotal();
              },
            ),
            const SizedBox(height: 24),

            Card(
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Valor Total do Orçamento',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'R\$ ${_total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _materialController.clear();
                      _laborController.clear();
                      _extraController.clear();
                      setState(() {
                        _total = 0;
                        _profit = 0.2;
                      });
                    },
                    child: const Text('Limpar'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF9DC06),
                    ),
                    onPressed: () {
                      if (_total > 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Orçamento de R\$ ${_total.toStringAsFixed(2)} salvo!',
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text('Salvar Orçamento'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
