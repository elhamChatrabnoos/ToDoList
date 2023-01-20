import 'package:flutter/material.dart';
import 'package:to_do_list/custom_views/custom_bottom_sheet.dart';
import 'package:to_do_list/custom_views/popup_menu_item.dart';
import 'package:to_do_list/core/data_access.dart';
import 'package:to_do_list/models/task.dart';

class CustomListItem extends StatefulWidget {
  CustomListItem({Key? key,
    required this.name,
    this.icon,
    this.number = '0',
    this.popupItemClick,
    required this.itemIndex,
    this.onSelectedPopupItem})
      : super(key: key);

  String name;
  IconData? icon;
  String number;
  final Function()? popupItemClick;
  final int itemIndex;
  Task? task;
  final Function(dynamic)? onSelectedPopupItem;

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {

  DataAccess dataAccess = DataAccess();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(widget.icon),
            const SizedBox(width: 10),
            Text(
              (widget.name.length > 20) ? widget.name.substring(0, 20) : widget.name,
              style: const TextStyle(color: Colors.black), 
            ),
            const Spacer(),
            PopupMenuButton(
                itemBuilder: (context) =>
                [
                  const PopupMenuItem(
                    child: CustomPopupItem(icon: Icons.edit, text: 'Edit'),
                  ),
                  const PopupMenuItem(
                    child: CustomPopupItem(icon: Icons.copy, text: 'Duplicate'),
                  ),
                  const PopupMenuItem(
                    child: CustomPopupItem(icon: Icons.delete, text: 'Delete',),
                  )
                ],
                onSelected: widget.onSelectedPopupItem,
            ),
          ],
        ));
  }
}
