import 'package:flutter/material.dart';

class CustomDrawerItem extends StatelessWidget {
   const CustomDrawerItem(
      {Key? key,
      required this.itemText,
      this.itemIcon = Icons.ac_unit,
      this.textSize = 20})
      : super(key: key);

  final String itemText;
  final IconData? itemIcon;
  final double? textSize;

  @override
  Widget build(BuildContext context) {

    double iconSize = textSize! + 7;

    return ListTile(
      leading: Icon(itemIcon, size: iconSize),
      title: Text(
        itemText,
        style: TextStyle(fontSize: textSize, fontWeight: FontWeight.normal),
      ),
    );
  }
}
