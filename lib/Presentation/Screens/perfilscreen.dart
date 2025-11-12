import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // CABEÇALHO COM ANIMAÇÃO
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            stretch: true,
            expandedHeight: 260,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  ClipOval(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 3),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/eubruno.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Bruno',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Prestador de Serviços',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          // CONTEÚDO PRINCIPAL
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FOTOS DE SERVIÇOS
                  const Text(
                    'Fotos de Serviços',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildServicePhoto('assets/images/pintura.jpg'),
                        _buildServicePhoto('assets/images/pedreiro.jpg'),
                        _buildServicePhoto('assets/images/eletrica.jpg'),
                        _buildServicePhoto('assets/images/chuveiro.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // SERVIÇOS QUE PRESTA
                  const Text(
                    'Serviços Prestados',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: const [
                      _ServiceChip('Pintura'),
                      _ServiceChip('Troca de Chuveiro'),
                      _ServiceChip('Elétrica Residencial'),
                      _ServiceChip('Pequenas Reformas'),
                      _ServiceChip('Instalação de Ventilador'),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // AVALIAÇÕES
                  const Text(
                    'Avaliações de Clientes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildReview(
                    'Maria Souza',
                    'Excelente profissional, muito caprichoso e pontual!',
                    5,
                  ),
                  _buildReview(
                    'Carlos Oliveira',
                    'Fez um ótimo trabalho na pintura do meu apartamento.',
                    4,
                  ),
                  _buildReview(
                    'Juliana Mendes',
                    'Serviço rápido e bem feito, recomendo!',
                    5,
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET: FOTO DE SERVIÇO
  Widget _buildServicePhoto(String path) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          path,
          width: 140,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // WIDGET: AVALIAÇÃO DE CLIENTE
  Widget _buildReview(String nome, String comentario, int estrelas) {
    return Card(
      color: Colors.grey[100],
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundColor: Colors.black12,
              child: Icon(Icons.person, color: Colors.black54),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nome,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < estrelas
                            ? Icons.star
                            : Icons.star_border_outlined,
                        size: 18,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                  Text(
                    comentario,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CHIP PERSONALIZADO DE SERVIÇOS
class _ServiceChip extends StatelessWidget {
  final String label;
  const _ServiceChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(color: Colors.black87),
      ),
      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
