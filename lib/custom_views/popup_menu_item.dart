import 'package:flutter/material.dart';

class CustomPopupItem extends StatelessWidget {
  const CustomPopupItem({Key? key, required this.icon, required this.text, this.onTap})
      : super(key: key);

  final IconData icon;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return PopupMenuItem(
      value: text,
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(
            width: 10,
          ),
          Text(text),
        ],
      ),
    );
  }
}
