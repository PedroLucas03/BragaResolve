import 'dart:math';

import 'package:flutter/material.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 48),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Visão geral', style: TextStyle(fontSize: 28)),
            const SizedBox(height: 32),
            budgetCard(),
            const SizedBox(height: 24),
            jobsCard(),
            const SizedBox(height: 24),
            avaliationCard(),
          ],
        ),
      ),
    );
  }

  Widget budgetCard() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Orçamentos pendentes', style: TextStyle(fontSize: 18)),
              Text(
                Random().nextInt(10).toString(),
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              Text(
                'Último recebido há 1h',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {},
                child: Text(
                  'Ver todos',
                  style: TextStyle(
                    color: Colors.yellow.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget jobsCard() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Serviços em andamento', style: TextStyle(fontSize: 18)),
              Text(
                Random().nextInt(10).toString(),
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              Text(
                'Próximo serviço em 2 dias',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {},
                child: Text(
                  'Abrir calendário',
                  style: TextStyle(
                    color: Colors.yellow.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget avaliationCard() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sua Avaliação', style: TextStyle(fontSize: 18)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    (Random().nextDouble() * 5).toStringAsFixed(1).toString(),
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12),
                  Icon(Icons.star, color: Colors.yellow.shade700),
                ],
              ),
              Text(
                'Baseado em ${Random().nextInt(100)} avaliações',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
