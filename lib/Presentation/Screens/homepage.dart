import 'package:flutter/material.dart';
import '../../Data/Services/notification_service.dart';
import 'budgetPage.dart';
import 'jobsPage.dart';
import 'perfilscreen.dart';
import 'resumePage.dart';
import 'notifications_page.dart';
import 'calculator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<int, Widget> currentPage = {
    0: const ResumePage(),
    1: const BudgetPage(),
    2: const JobsPage(),
    3: const PerfilScreen(),
  };
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final unreadCount = NotificationService.getUnreadCount();

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: ClipOval(
            child: Image.asset('assets/images/eubruno.png', fit: BoxFit.cover),
          ),
        ),
        leadingWidth: 64,
        title: const Text('Olá, Bruno!', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          // Botão de notificações
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationsPage(),
                        ),
                      )
                      .then((_) {
                        // Atualizar a tela quando voltar
                        setState(() {});
                      });
                },
                icon: const Icon(Icons.notifications, color: Colors.black),
              ),
              if (unreadCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      unreadCount > 99 ? '99+' : unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            onPressed: () => Navigator.of(
              context,
            ).pushNamedAndRemoveUntil('/', (route) => false),
            icon: const Icon(Icons.exit_to_app_rounded, color: Colors.red),
          ),
        ],
        actionsPadding: const EdgeInsets.symmetric(horizontal: 12),
        backgroundColor: const Color(0xFFF9DC06),
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
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Resumo',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text(
                NotificationService.getUnreadCount() > 0
                    ? '${NotificationService.getUnreadCount()}'
                    : '',
              ),
              isLabelVisible: NotificationService.getUnreadCount() > 0,
              child: const Icon(Icons.request_page),
            ),
            label: 'Orçamentos',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Serviços',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Meu Perfil',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CalculatorPage()),
          );
        },
        backgroundColor: const Color(0xFFF9DC06),
        child: const Icon(Icons.calculate, color: Colors.black),
      ),
    );
  }
}
