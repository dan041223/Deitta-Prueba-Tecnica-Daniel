import 'package:deitta_prueba/enums/group.dart';
import 'package:deitta_prueba/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deitta_prueba/models/notification_item.dart';

void main() {
  group('NotificationPage Widget Tests', () {
    testWidgets('Muestra título, descripción y botón inicial', (
      WidgetTester tester,
    ) async {
      final notification = NotificationItem(
        id: '1',
        isRead: false,
        title: 'Título de prueba',
        description: 'Descripción de prueba',
        timestamp: DateTime.now(),
        group: Group.today,
      );

      await tester.pumpWidget(
        MaterialApp(home: NotificationPage(notification: notification)),
      );

      expect(find.text('Título de prueba'), findsOneWidget);
      expect(find.text('Descripción de prueba'), findsOneWidget);
      expect(find.text('Marcar como leído'), findsOneWidget);
    });

    testWidgets('Marca como leído al presionar el botón', (
      WidgetTester tester,
    ) async {
      final notification = NotificationItem(
        id: '1',
        isRead: false,
        title: 'Título de prueba',
        description: 'Descripción de prueba',
        timestamp: DateTime.now(),
        group: Group.today,
      );

      await tester.pumpWidget(
        MaterialApp(home: NotificationPage(notification: notification)),
      );

      await tester.tap(find.text('Marcar como leído'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Ya leído'), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
      expect(notification.isRead, true);
    });

    testWidgets('Muestra "Ya leído" si la notificación ya estaba leída', (
      WidgetTester tester,
    ) async {
      final notification = NotificationItem(
        id: '1',
        isRead: true,
        title: 'Título de prueba',
        description: 'Descripción de prueba',
        timestamp: DateTime.now(),
        group: Group.today,
      );

      await tester.pumpWidget(
        MaterialApp(home: NotificationPage(notification: notification)),
      );

      expect(find.text('Ya leído'), findsOneWidget);
      expect(find.text('Marcar como leído'), findsNothing);
    });
  });
}
