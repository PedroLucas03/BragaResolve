import 'package:braga_resolve/Screens/orcamentoscreen.dart';
import 'package:flutter/material.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          builder: (context) => Budget(),
        ),
        child: Text('Novo serviço'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Meus serviços', style: TextStyle(fontSize: 28)),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(padding: EdgeInsets.zero, children: _items()),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _items() {
    List<Widget> items = [
      ListTile(
        onTap: () => showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(content: Text('Edição ainda não disponível')),
        ),
        leading: Icon(Icons.format_paint),
        title: Text('Pintura Residencial'),
        subtitle: Text('A partir de R\$ 50/m²'),
        trailing: Switch(value: true, onChanged: (value) {}),
      ),
      ListTile(
        leading: Icon(Icons.electric_bolt),
        title: Text('Instalação Elétrica'),
        subtitle: Text('A partir de R\$ 80/h'),
        trailing: Switch(value: true, onChanged: (value) {}),
      ),
      ListTile(
        leading: Icon(Icons.plumbing),
        title: Text('Encanamento'),
        subtitle: Text('A partir de R\$ 20/m'),
        trailing: Switch(value: false, onChanged: (value) {}),
      ),
    ];
    return items;
  }
}
