import 'package:flutter/material.dart';

import 'data_access.dart';

class Variables{

  static DataAccess dataAccess = DataAccess();
  static String? taskName;
  static bool? platformIsAndroid = false;
  static Color? iconsColor = Colors.white;

  //// icons in bottomSheet dialog
  static List<IconData>? iconsList = [
    Icons.ac_unit,
    Icons.adb_sharp,
    Icons.account_balance_sharp,
    Icons.add_card,
    Icons.account_balance_wallet_rounded,
    Icons.accessibility_new_sharp
  ];

  List<bool> itemSelected = List.generate(6, (index) => false);

}

