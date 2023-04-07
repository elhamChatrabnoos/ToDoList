import 'package:flutter/material.dart';
import 'package:to_do_list/core/constants.dart';

import 'custom_drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, this.actionOnTap}) : super(key: key);

  final Function()? actionOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/4,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          color: const Color.fromARGB(200, 255, 213, 179),
          child: const Text('TO DO LIST',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  fontSize: 30)),
        ),
        CustomSizes.littleHeight,
        Expanded(
            child: ListView(
          children: [
            InkWell(
              onTap: actionOnTap,
              child: const CustomDrawerItem(
                  itemText: 'Load data', itemIcon: Icons.get_app),
            ),
            InkWell(
              onTap: () {},
              child: const CustomDrawerItem(
                  itemText: 'Settings', itemIcon: Icons.settings),
            )
          ],
        ))
      ],
    );
  }
}
