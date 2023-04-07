import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/core/variables.dart';
import 'package:to_do_list/custom_views/custom_bottom_sheet.dart';
import 'package:to_do_list/custom_views/custom_floating_button.dart';
import 'package:to_do_list/custom_views/custom_list_item.dart';

import '../core/keys.dart';
import '../models/task.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.task}) : super(key: key);

  final String? task;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final taskBox = Hive.box<Task>(CustomKeys.taskListDb);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle(),
      body: listViewInBody(),
      floatingActionButton: floatingButtonAction(context),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whichPlatform();
  }


  AppBar appBarTitle() {
    return AppBar(
        title: Text(Variables.platformIsAndroid! ? 'ToDos' : ''),
        centerTitle: true);
  }

  void whichPlatform() {
    if (kIsWeb) {
      Variables.platformIsAndroid = false;
    } else if (Platform.isAndroid) {
      Variables.platformIsAndroid = true;
    }
  }

  Widget floatingButtonAction(BuildContext context) {
    return CustomFloatingButton(
      icon: Icons.add,
      onPressed: () {
        setState(() {
          showModalBottomSheet(
            context: context,
            builder: (context) => CustomBottomSheet(),
          ).then(
            (value) {
              setState(() {
                _saveNewTask(value);
              });
            },
          );
        });
      },
    );
  }

  Future<void> _saveNewTask(value) async {
    Task newTask = Task(
        taskName: (value)['taskName'],
        taskImage: 'assets/images/work.jpg');
    Variables.dataAccess.insertTask(newTask);
  }

  Widget listViewInBody() {
    // show background for page
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: taskBox.length > 0 ? ListView.builder(
        itemCount: taskBox.length,
        itemExtent: 60,
        padding: const EdgeInsets.all(30),
        itemBuilder: (context, index) => InkWell(
          child: CustomListItem(
            itemIndex: index,
            name: taskBox.getAt(index)!.taskName,
            icon: Icons.ac_unit,
            iconColor: Colors.black45,
            onSelectedPopupItem: (value) {
              updateList(value, index);
            },
          ),
        ),
      ) : const Center(
        child: Text('no item added yet.'),
      ),
    );
  }

  void updateList(dynamic value, int index) {
    if (value == 'Delete') {
      setState(() {
        taskBox.deleteAt(index);
      });
    }
    if (value == 'Edit') {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return CustomBottomSheet(task: taskBox.getAt(index)!);
        },
      ).then(
        (value) {
          setState(() {
            final task = taskBox.getAt(index);
            task?.taskName = (value)['taskName'];
            task?.save();
          });
        },
      );
    }
  }
}
