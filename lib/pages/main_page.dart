import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/core/data_access.dart';
import 'package:to_do_list/core/variables.dart';
import 'package:to_do_list/custom_views/custom_bottom_sheet.dart';
import 'package:to_do_list/custom_views/custom_drawer.dart';
import 'package:to_do_list/custom_views/custom_floating_button.dart';
import 'package:to_do_list/custom_views/custom_list_item.dart';
import 'package:to_do_list/pages/data_from_server.dart';

import '../models/task.dart';
import 'details.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.task}) : super(key: key);
  final String? task;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle(),
      body: listViewInBody(),
      floatingActionButton: floatingButtonAction(context),
      drawer: buildDrawer(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataAccess().defineSharedPref();
    whichPlatform();
  }

  AppBar appBarTitle() {
    return AppBar(
        title: Text(Variables.platformIsAndroid!
            ? 'Android application'
            : 'Web application'),
        centerTitle: true);
  }

  void whichPlatform() {
    if (kIsWeb) {
      Variables.platformIsAndroid = false;
    } else if (Platform.isAndroid) {
      Variables.platformIsAndroid = true;
    }
  }

  Widget buildDrawer() {
    return Drawer(child: CustomDrawer(
      actionOnTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DataFromServer()));
      },
    ));
  }

  Widget floatingButtonAction(BuildContext context) {
    return CustomFloatingButton(
      icon: Icons.add,
      onPressed: () {
        setState(() {
          showModalBottomSheet(
            context: context,
            builder: (context) => CustomBottomSheet(),)
              .then((value) {
              setState(() {
                Task newTask = Task(
                    taskName: (value)['taskName'],
                    taskIcon: (value)['taskIcon'],
                    taskImage: 'assets/images/work.jpg');
                Variables.dataAccess.insertTask(newTask);
                Variables.dataAccess.addTaskToShPref();
              });
            },
          );
        });
      },
    );
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
      child: ListView.builder(
        itemCount: Variables.tasksList.length,
        itemExtent: 60,
        padding: const EdgeInsets.all(30),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(task: Variables.tasksList[index]),
                ));
          },
          child: CustomListItem(
            itemIndex: index,
            name: Variables.tasksList[index].taskName,
            icon: Variables.tasksList[index].taskIcon!,
            iconColor: Colors.black45,
            onSelectedPopupItem: (value) {
              updateList(value, index);
            },
          ),
        ),
      ),
    );
  }

  void updateList(dynamic value, int index) {
    if (value == 'Delete') {
      setState(() {
        Variables.dataAccess.deleteTask(Variables.tasksList[index]);
      });
    }
    if (value == 'Edit') {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return CustomBottomSheet(task: Variables.tasksList[index]);
        },
      ).then((value) {
          setState(() {
            Variables.tasksList[index].taskName = (value)['taskName'];
            Variables.tasksList[index].taskIcon = (value)['taskIcon'];
            Variables.dataAccess.addTaskToShPref();
          });
        },
      );
    }
  }
}
