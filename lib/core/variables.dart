import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task.dart';
import 'data_access.dart';

class Variables{

  static DataAccess dataAccess = DataAccess();
  static String? taskName;
  static SharedPreferences? taskShPreference;
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

  static List<Task> tasksList = [
    Task(
        taskName: 'buy',
        taskIcon: Icons.add_business_outlined,
        taskImage: 'assets/images/buy.png'
    ),
    Task(
        taskName: 'excersice',
        taskIcon: Icons.directions_run_outlined,
        taskImage: 'assets/images/excersice.webp'
    ),
    Task(
        taskName: 'work',
        taskIcon: Icons.work,
        taskImage: 'assets/images/work.jpg'
    ),
    Task(
        taskName: 'study',
        taskIcon: Icons.book,
        taskImage: 'assets/images/study.jpg'
    ),
    Task(
        taskName: 'sleep',
        taskIcon: Icons.airline_seat_legroom_extra,
        taskImage: 'assets/images/sleep.webp'
    ),
    Task(
        taskName: 'session',
        taskIcon: Icons.group,
        taskImage: 'assets/images/session.jpg'
    )
  ];

}

