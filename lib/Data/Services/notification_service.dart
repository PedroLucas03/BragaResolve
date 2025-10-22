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