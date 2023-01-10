import 'package:flutter/material.dart';
import 'package:to_do_list/custom_views/custom_bottom_sheet.dart';
import 'package:to_do_list/custom_views/custom_floating_button.dart';
import 'package:to_do_list/database/data_access.dart';
import 'package:to_do_list/custom_views/custom_list-item.dart';

import '../models/task.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.task}) : super(key: key);

  final String? task;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  DataAccess dataAccess = DataAccess();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      ListView.builder(
          itemCount: tasksList.length,
          itemExtent: 60,
          padding: const EdgeInsets.all(30),
          itemBuilder: (context, index) => CustomListItem(
                itemIndex: index,
                name: tasksList[index].taskName,
                icon: tasksList[index].taskIcon,
              )
      ),
      floatingActionButton: CustomFloatingButton(
        icon: Icons.add,
        onPressed: () {
          setState(() {
            showModalBottomSheet(context: context, builder: (context) {
              return CustomBottomSheet();
            }
            );
          });
        },
      ),
    );
  }
}
