import 'package:flutter/material.dart';
import 'package:to_do_list/custom_views/custom_list-item.dart';

import '../models/todos.dart';

class DataFromServer extends StatefulWidget {
  const DataFromServer({Key? key}) : super(key: key);

  @override
  State<DataFromServer> createState() => _DataFromServerState();
}

class _DataFromServerState extends State<DataFromServer> {
  List<Todos> todosList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todosList.length,
        itemBuilder: (context, index) => CustomListItem(
          name: todosList[index].title!,
          itemIndex: index,
        ),
      ),
    );
  }
}
