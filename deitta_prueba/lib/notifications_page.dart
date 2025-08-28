import 'package:deitta_prueba/enums/group.dart';
import 'package:deitta_prueba/models/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  List<NotificationItem> notifications = [];
  Function onNotificationTap;
  NotificationsPage({
    super.key,
    required this.onNotificationTap,
    required this.notifications,
  });

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  // Función para traducir enum a texto amigable
  String groupLabel(Group group) {
    switch (group) {
      case Group.today:
        return "Hoy";
      case Group.last7Days:
        return "Últimos 7 días";
      case Group.last30Days:
        return "Últimos 30 días";
      case Group.moreThan30Days:
        return "Más de 30 días";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (widget.notifications.isEmpty) {
      return const Center(child: Text("No hay notificaciones"));
    }

    // Agrupar notificaciones por group
    final Map<Group, List<NotificationItem>> groupedNotifications = {};
    for (var n in widget.notifications) {
      if (!groupedNotifications.containsKey(n.group)) {
        groupedNotifications[n.group] = [];
      }
      groupedNotifications[n.group]!.add(n);
    }

    // Orden específico de los grupos
    final List<Group> groupOrder = [
      Group.today,
      Group.last7Days,
      Group.last30Days,
      Group.moreThan30Days,
    ];

    List<Widget> listWidgets = [];

    for (var group in groupOrder) {
      final groupList = groupedNotifications[group] ?? [];
      if (groupList.isNotEmpty) {
        // Encabezado traducido
        listWidgets.add(
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              groupLabel(group),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        );

        // Notificaciones del grupo
        listWidgets.addAll(
          groupList.map(
            (n) => Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ), // separación entre tiles
              decoration: BoxDecoration(
                color: Colors.white, // fondo del ListTile
                border: Border.all(color: Colors.black), // borde negro
                borderRadius: BorderRadius.circular(12), // esquinas redondeadas
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ], // opcional, sombra suave
              ),
              child: ListTile(
                onTap: () {
                  setState(() {
                    widget.onNotificationTap(n);
                  });
                },
                title: Text(n.title),
                subtitle: Text(n.description),
              ),
            ),
          ),
        );
      }
    }

    return ListView(children: listWidgets);
  }
}
