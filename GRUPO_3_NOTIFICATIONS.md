# GRUPO 3 - Sistema de Notificações e Funcionalidades

## 🎯 Objetivo
Implementar um sistema de notificações internas e melhorar a navegação do app

## 📋 Tarefas
1. Criar sistema de notificações internas
2. Implementar badge de notificações no BottomNavigationBar
3. Criar tela de notificações
4. Adicionar funcionalidade de marcar como lida

## 📁 Arquivos a serem criados/modificados

### 1. Criar modelo de notificação
**Caminho:** `lib/Data/Models/notification_model.dart`

```dart
class NotificationModel {
  final String id;
  final String title;
  final String message;
  final DateTime createdAt;
  final bool isRead;
  final String type; // 'info', 'warning', 'success', 'error'
  final String? actionUrl;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
    this.isRead = false,
    this.type = 'info',
    this.actionUrl,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? message,
    DateTime? createdAt,
    bool? isRead,
    String? type,
    String? actionUrl,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
      type: type ?? this.type,
      actionUrl: actionUrl ?? this.actionUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'createdAt': createdAt.toIso8601String(),
      'isRead': isRead,
      'type': type,
      'actionUrl': actionUrl,
    };
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: json['title'],
      message: json['message'],
      createdAt: DateTime.parse(json['createdAt']),
      isRead: json['isRead'] ?? false,
      type: json['type'] ?? 'info',
      actionUrl: json['actionUrl'],
    );
  }
}
```

### 2. Criar serviço de notificações
**Caminho:** `lib/Data/Services/notification_service.dart`

```dart
import 'dart:math';
import '../Models/notification_model.dart';

class NotificationService {
  static final List<NotificationModel> _notifications = [
    NotificationModel(
      id: '1',
      title: 'Novo Orçamento Aprovado!',
      message: 'Seu orçamento para "Instalação Elétrica" foi aprovado pelo cliente.',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      type: 'success',
    ),
    NotificationModel(
      id: '2',
      title: 'Pagamento Recebido',
      message: 'Você recebeu R\$ 320,00 pelo serviço "Reparo Hidráulico".',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      type: 'success',
    ),
    NotificationModel(
      id: '3',
      title: 'Nova Solicitação de Orçamento',
      message: 'Cliente solicitou orçamento para "Pintura de Casa".',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      type: 'info',
      isRead: false,
    ),
    NotificationModel(
      id: '4',
      title: 'Avaliação Recebida',
      message: 'Você recebeu uma avaliação de 5 estrelas! ⭐⭐⭐⭐⭐',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      type: 'info',
      isRead: true,
    ),
    NotificationModel(
      id: '5',
      title: 'Lembrete: Visita Agendada',
      message: 'Você tem uma visita agendada amanhã às 14h30.',
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      type: 'warning',
      isRead: false,
    ),
  ];

  // Obter todas as notificações
  static List<NotificationModel> getAllNotifications() {
    return List.from(_notifications)..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  // Obter notificações não lidas
  static List<NotificationModel> getUnreadNotifications() {
    return _notifications.where((notification) => !notification.isRead).toList();
  }

  // Contar notificações não lidas
  static int getUnreadCount() {
    return _notifications.where((notification) => !notification.isRead).length;
  }

  // Marcar notificação como lida
  static void markAsRead(String notificationId) {
    final index = _notifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _notifications[index] = _notifications[index].copyWith(isRead: true);
    }
  }

  // Marcar todas como lidas
  static void markAllAsRead() {
    for (int i = 0; i < _notifications.length; i++) {
      _notifications[i] = _notifications[i].copyWith(isRead: true);
    }
  }

  // Adicionar nova notificação (simulação)
  static void addNotification(NotificationModel notification) {
    _notifications.insert(0, notification);
  }

  // Simular chegada de nova notificação
  static NotificationModel createRandomNotification() {
    final titles = [
      'Novo Cliente Interessado',
      'Orçamento Solicitado',
      'Pagamento Confirmado',
      'Avaliação Recebida',
      'Mensagem do Cliente',
    ];
    
    final messages = [
      'Um novo cliente está interessado nos seus serviços.',
      'Cliente solicitou orçamento para reforma.',
      'Pagamento de R\$ 450,00 foi confirmado.',
      'Você recebeu uma nova avaliação.',
      'Cliente enviou uma mensagem sobre o projeto.',
    ];

    final types = ['info', 'success', 'warning'];
    final random = Random();

    return NotificationModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: titles[random.nextInt(titles.length)],
      message: messages[random.nextInt(messages.length)],
      createdAt: DateTime.now(),
      type: types[random.nextInt(types.length)],
    );
  }

  // Remover notificação
  static void removeNotification(String notificationId) {
    _notifications.removeWhere((n) => n.id == notificationId);
  }
}
```

### 3. Criar tela de notificações
**Caminho:** `lib/Presentation/Screens/notifications_page.dart`

```dart
import 'package:flutter/material.dart';
import '../../Data/Models/notification_model.dart';
import '../../Data/Services/notification_service.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<NotificationModel> notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  void _loadNotifications() {
    setState(() {
      notifications = NotificationService.getAllNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
        backgroundColor: const Color(0xFFF9DC06),
        actions: [
          if (NotificationService.getUnreadCount() > 0)
            TextButton(
              onPressed: () {
                NotificationService.markAllAsRead();
                _loadNotifications();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Todas as notificações foram marcadas como lidas')),
                );
              },
              child: const Text(
                'Marcar todas como lidas',
                style: TextStyle(color: Colors.black),
              ),
            ),
        ],
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_off, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Nenhuma notificação',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: () async {
                // Simular nova notificação
                final newNotification = NotificationService.createRandomNotification();
                NotificationService.addNotification(newNotification);
                _loadNotifications();
              },
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return _buildNotificationCard(notification);
                },
              ),
            ),
    );
  }

  Widget _buildNotificationCard(NotificationModel notification) {
    IconData icon;
    Color iconColor;

    switch (notification.type) {
      case 'success':
        icon = Icons.check_circle;
        iconColor = Colors.green;
        break;
      case 'warning':
        icon = Icons.warning;
        iconColor = Colors.orange;
        break;
      case 'error':
        icon = Icons.error;
        iconColor = Colors.red;
        break;
      default:
        icon = Icons.info;
        iconColor = Colors.blue;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      color: notification.isRead ? null : Colors.blue.withOpacity(0.05),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                notification.title,
                style: TextStyle(
                  fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ),
            if (!notification.isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(notification.message),
            const SizedBox(height: 8),
            Text(
              _formatDateTime(notification.createdAt),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        onTap: () {
          if (!notification.isRead) {
            NotificationService.markAsRead(notification.id);
            _loadNotifications();
          }
          _showNotificationDetails(notification);
        },
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            if (!notification.isRead)
              const PopupMenuItem(
                value: 'mark_read',
                child: Row(
                  children: [
                    Icon(Icons.mark_email_read),
                    SizedBox(width: 8),
                    Text('Marcar como lida'),
                  ],
                ),
              ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Excluir', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case 'mark_read':
                NotificationService.markAsRead(notification.id);
                _loadNotifications();
                break;
              case 'delete':
                NotificationService.removeNotification(notification.id);
                _loadNotifications();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notificação removida')),
                );
                break;
            }
          },
        ),
      ),
    );
  }

  void _showNotificationDetails(NotificationModel notification) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(notification.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.message),
            const SizedBox(height: 16),
            Text(
              'Recebida em: ${_formatDateTime(notification.createdAt)}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Agora';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m atrás';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h atrás';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d atrás';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
```

### 4. Modificar HomePage para incluir notificações
**Substitua o conteúdo do arquivo:** `lib/Presentation/Screens/homepage.dart`

```dart
import 'package:flutter/material.dart';
import '../../Data/Services/notification_service.dart';
import 'budgetPage.dart';
import 'jobsPage.dart';
import 'perfilscreen.dart';
import 'resumePage.dart';
import 'notifications_page.dart';

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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NotificationsPage(),
                    ),
                  ).then((_) {
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
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false),
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
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Resumo'),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text(NotificationService.getUnreadCount() > 0 ? '${NotificationService.getUnreadCount()}' : ''),
              isLabelVisible: NotificationService.getUnreadCount() > 0,
              child: const Icon(Icons.request_page),
            ),
            label: 'Orçamentos',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Serviços'),
          const BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Meu Perfil'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Simular nova notificação
          final newNotification = NotificationService.createRandomNotification();
          NotificationService.addNotification(newNotification);
          setState(() {});
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Nova notificação recebida!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        backgroundColor: const Color(0xFFF9DC06),
        child: const Icon(Icons.add_alert, color: Colors.black),
      ),
    );
  }
}
```

## 🚀 Como implementar
1. Criar a pasta `Models` em `lib/Data/` se não existir
2. Criar todos os arquivos listados acima
3. Substituir o conteúdo do `homepage.dart`
4. Testar as funcionalidades

## ✅ Funcionalidades implementadas
- ✅ Sistema completo de notificações internas
- ✅ Badge de contador no AppBar e BottomNavigationBar  
- ✅ Tela dedicada para visualizar notificações
- ✅ Marcar como lida individual e em lote
- ✅ Diferentes tipos de notificação (info, success, warning, error)
- ✅ Pull-to-refresh para simular novas notificações
- ✅ Menu de contexto para cada notificação
- ✅ Formatação inteligente de tempo
- ✅ FloatingActionButton para simular notificações

## 🧪 Como testar
1. Execute o app e observe o ícone de notificações no AppBar
2. Toque no ícone para ver a lista de notificações
3. Teste marcar como lida individualmente
4. Use "Marcar todas como lidas"
5. Teste o botão flutuante para criar nova notificação
6. Observe os badges atualizando em tempo real

## 🎨 Personalizações possíveis
- Adicionar sons de notificação
- Implementar notificações push reais
- Criar diferentes categorias de notificação
- Adicionar persistência local (SharedPreferences/SQLite)