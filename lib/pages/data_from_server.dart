import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/custom_views/custom_list_item.dart';

import '../models/todos.dart';

class DataFromServer extends StatefulWidget {
  const DataFromServer({Key? key}) : super(key: key);

  @override
  State<DataFromServer> createState() => _DataFromServerState();

}

class _DataFromServerState extends State<DataFromServer> {

  List<Todos> todosList = [];
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: todosList.length,
              itemBuilder: (context, index) => CustomListItem(
                    name: todosList[index].title!,
                    itemIndex: index,
                    icon: Icons.ac_unit,
                  )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData().then((value) {
      setState(() {
        todosList.addAll(value);
        loading = false;
      });
    });
  }

  Future<List<Todos>> getData() async {
    loading = true;
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final todos = await Dio().get(url);
    List<Todos> todosList =
        todos.data.map<Todos>((e) => Todos.fromJson(e)).toList();
    return todosList;
  }

}
