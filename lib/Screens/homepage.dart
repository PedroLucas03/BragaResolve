import 'package:braga_resolve/Screens/budgetPage.dart';
import 'package:braga_resolve/Screens/jobsPage.dart';
import 'package:braga_resolve/Screens/perfilscreen.dart';
import 'package:braga_resolve/Screens/resumePage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<int, Widget> currentPage = {
    0: ResumePage(),
    1: BudgetPage(),
    2: JobsPage(),
    3: PerfilScreen(),
  };
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: ClipOval(
            child: Image.asset('assets/images/eubruno.png', fit: BoxFit.cover),
          ),
        ),

        leadingWidth: 64,
        title: Text('Olá, Bruno!', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/', (route) => false),
            icon: Icon(Icons.exit_to_app_rounded, color: Colors.red),
          ),
        ],
        actionsPadding: EdgeInsets.symmetric(horizontal: 12),
        backgroundColor: Color(0xFFF9DC06),
      ),
      body: currentPage[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedItemColor: Colors.amber,
        currentIndex: currentPageIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Resumo'),
          BottomNavigationBarItem(
            icon: Badge(label: Text('2'), child: Icon(Icons.request_page)),
            label: 'Orçamentos',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Serviços'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Meu Perfil',
          ),
        ],
      ),
    );
  }
}
