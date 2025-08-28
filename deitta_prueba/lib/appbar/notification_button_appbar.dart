import 'package:flutter/material.dart';

class NotificationButtonAppBar extends StatelessWidget {
  const NotificationButtonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none_outlined),
        ),
      ),
    );
  }
}
