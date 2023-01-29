import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);

  final Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: onPressed,
        child: Icon(icon, color: Colors.white,)
    );
  }
}

