import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);

  final Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(icon),
        foregroundColor: Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Color.fromARGB(255, 232, 105, 105),
        onPressed: onPressed
    );
  }
}

