import 'package:flutter/material.dart';

class BackButtonAppBar extends StatelessWidget {
  BackButtonAppBar({super.key, required this.onBackButtonPressed});
  Function onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: IconButton(
          onPressed: () {
            onBackButtonPressed();
          },
          icon: Icon(Icons.chevron_left_rounded),
        ),
      ),
    );
  }
}
