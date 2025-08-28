import 'package:deitta_prueba/models/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({super.key, required this.notification});
  NotificationItem notification;

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Text(
              widget.notification.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Fecha / grupo
            Text(
              'Estado: ${widget.notification.isRead ? "Leída" : "No leída"}', // o usa función para mostrar 'Hoy', etc.
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 16),

            // Descripción
            Text(
              widget.notification.description,
              style: const TextStyle(fontSize: 16),
            ),

            const Spacer(),

            // Botón de acción
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // acción al marcar como leído
                  ScaffoldMessenger.of(context).showSnackBar(
                    widget.notification.isRead
                        ? SnackBar(
                            content: Text(
                              'La notificación ya estaba marcada como leída',
                            ),
                          )
                        : SnackBar(
                            content: Text('Notificación marcada como leída'),
                          ),
                  );
                  widget.notification.isRead
                      ? null
                      : setState(() {
                          widget.notification.isRead = true;
                        });
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.notification.isRead
                      ? Colors.grey
                      : Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: widget.notification.isRead
                    ? Text(
                        'Ya leído',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )
                    : Text(
                        'Marcar como leído',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
