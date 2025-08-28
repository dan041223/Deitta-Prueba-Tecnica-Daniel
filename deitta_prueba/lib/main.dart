import 'package:deitta_prueba/appbar/appbar_notifications.dart';
import 'package:deitta_prueba/functions/json_functions.dart';
import 'package:deitta_prueba/models/notification_item.dart';
import 'package:deitta_prueba/notification_page.dart';
import 'package:deitta_prueba/notifications_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Widget actualPage;
  List<NotificationItem> notifications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    setState(() {
      isLoading = true;
    });

    notifications = await JsonFunctions.loadJsonData();

    setState(() {
      showNotificationsPage();
      isLoading = false;
    });
  }

  showNotificationsPage() {
    setState(() {
      actualPage = NotificationsPage(
        notifications: notifications,
        onNotificationTap: (n) {
          setState(() {
            actualPage = NotificationPage(notification: n);
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoading
          ? Scaffold(body: const Center(child: CircularProgressIndicator()))
          : Scaffold(
              appBar: AppBarNotifications(
                showBackButton: actualPage is NotificationPage,
                backButtonPressed: () {
                  showNotificationsPage();
                },
              ),
              body: actualPage,
            ),
    );
  }
}
