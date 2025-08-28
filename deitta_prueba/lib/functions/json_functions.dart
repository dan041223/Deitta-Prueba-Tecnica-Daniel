import 'dart:convert';

import 'package:deitta_prueba/models/notification_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class JsonFunctions {
  static Future<List<NotificationItem>> loadJsonData() async {
    try {
      String response = await rootBundle.loadString('data/data.json');

      final data = json.decode(response);

      List<NotificationItem> notificaciones = (data['notifications'] as List)
          .map((e) => NotificationItem.fromJson(e))
          .toList();
      return notificaciones;
    } on FlutterError catch (e) {
      print('Error al cargar el archivo JSON: $e');
      return [];
    } on FormatException catch (e) {
      print('Error de formato en el JSON: $e');
      return [];
    } catch (e) {
      print('Error inesperado: $e');
      return [];
    }
  }
}
