import 'package:deitta_prueba/appbar/back_button_appbar.dart';
import 'package:deitta_prueba/appbar/notification_button_appbar.dart';
import 'package:flutter/material.dart';

class AppBarNotifications extends StatefulWidget
    implements PreferredSizeWidget {
  Function backButtonPressed;
  bool showBackButton;
  AppBarNotifications({
    super.key,
    required this.backButtonPressed,
    required this.showBackButton,
  });

  @override
  State<AppBarNotifications> createState() => _AppBarNotificationsState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarNotificationsState extends State<AppBarNotifications> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [NotificationButtonAppBar()],
      leading: widget.showBackButton
          ? BackButtonAppBar(onBackButtonPressed: widget.backButtonPressed)
          : null,
      centerTitle: true,
      title: Text("Notificaciones"),
    );
  }
}
