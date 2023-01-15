import 'package:flutter/material.dart';
import 'package:to_do_list/custom_views/custom_bottom_sheet.dart';
import 'package:to_do_list/custom_views/custom_floating_button.dart';
import 'package:to_do_list/database/data_access.dart';
import 'package:to_do_list/custom_views/custom_list-item.dart';

import '../models/task.dart';
import 'details.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.task}) : super(key: key);

  final String? task;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DataAccess dataAccess = DataAccess();

  String? taskName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tasksList.length,
        itemExtent: 60,
        padding: const EdgeInsets.all(30),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(task: tasksList[index]),
                ));
          },
          child: CustomListItem(
            itemIndex: index,
            name: tasksList[index].taskName,
            icon: tasksList[index].taskIcon,
            onSelectedPopupItem: (value) {
              updateList(value, index);
            },
          ),
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        icon: Icons.add,
        onPressed: () {
          setState(() async {
            await showModalBottomSheet(
              context: context,
              builder: (context) => CustomBottomSheet(),
            ).then(
              (value) {
                setState(() {
                  dataAccess.insertTask(
                      Task(taskName: value,
                          taskIcon: const Icon(Icons.ac_unit), taskImage: 'images/work.jpg'));
                });
              },
            );
          });
        },
      ),
    );
  }

  void updateList(dynamic value, int index) {
    if (value == 'Delete') {
      setState(() {
        dataAccess.deleteTask(tasksList[index]);
      });
    }
    if (value == 'Edit') {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return CustomBottomSheet(task: tasksList[index]);
        },
      ).then((value) {
        setState(() {
          tasksList[index].taskName = value;
          // dataAccess.updateTask(index, tasksList[index]);
        });
       },
      );
    }
  }
}
