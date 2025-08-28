import 'package:deitta_prueba/enums/group.dart';

class NotificationItem {
  String id;
  bool isRead;
  String title;
  String description;
  DateTime timestamp;
  Group group;

  NotificationItem({
    required this.id,
    required this.isRead,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.group,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      isRead: json['isRead'],
      title: json['title'],
      description: json['description'],
      timestamp: DateTime.parse(json['timestamp']),
      group: Group.values.firstWhere((g) => g.name == json['group']),
    );
  }
}
