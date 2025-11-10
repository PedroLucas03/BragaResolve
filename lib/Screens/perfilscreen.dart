import 'package:braga_resolve/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int childCount = 6;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          stretch: false,
          leading: Container(),
          onStretchTrigger: () async {},
          stretchTriggerOffset: 200.0,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            expandedTitleScale: 1,
            collapseMode: CollapseMode.pin,
            centerTitle: true,

            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .35,
                  child: ClipOval(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(width: 4),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/eubruno.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text('Bruno Pedreiro'),
              ],
            ),
            background: Image.asset(
              themeProvider.themeMode == ThemeMode.dark
                  ? 'assets/images/dark_theme_background.jpg'
                  : 'assets/images/light_mode_background.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Center(child: Text('Alvenaria - Fundação - Acabamento')),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Especializado em alvenaria, acabamento e reformas. Comprometido com qualidade, segurança e entrega no prazo. Transformando projetos em realidade com dedicação e experiência.. Solicite seu orçamento!',
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 18)),
        SliverToBoxAdapter(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.amber.shade600),
              ),
              child: Text(
                'Solicitar orçamento',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Serviços ofertados:', style: TextStyle(fontSize: 32)),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 40, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('• Pintura Residencial'),
                Text('• Instalação Elétrica'),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Fotos:', style: TextStyle(fontSize: 32)),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  titleTextStyle: TextStyle(fontSize: 14),
                  title: Text('Imagem ${index + 1} de $childCount'),
                  content: Image.asset(
                    'Assets/Images/job_example_${index + 1}.jpg',
                    fit: BoxFit.cover,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Ok'),
                    ),
                  ],
                ),
              ),
              child: Image.asset(
                'Assets/Images/job_example_${index + 1}.jpg',
                fit: BoxFit.cover,
              ),
            ),
            childCount: childCount,
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 32)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('Avaliações:', style: TextStyle(fontSize: 32)),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            userComment(
              'Adriane Deufino',
              'Assets/Images/adriani.png',
              'Bruno fez um excelente trabalho consertando minha pia da cozinha. Profissional, eficiente e muito simpático. Recomendo!',
            ),
            userComment(
              'Natália Rofimen',
              'Assets/Images/nathaly.jpg',
              'Bruno pintou minha sala e o resultado ficou fantástico. Pontual, organizado e com qualidade impecável.',
            ),
          ]),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }

  Widget userComment(String name, String userImage, String comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: ClipOval(
                  child: Image.asset(userImage, fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('1 mês atrás', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: List.generate(
              5,
              (index) => Icon(Icons.star, color: Colors.amber, size: 20),
            ),
          ),
          SizedBox(height: 8),
          Text(comment),
        ],
      ),
    );
  }
}
