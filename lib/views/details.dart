import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';

class DetailsPage extends StatelessWidget {
     DetailsPage({Key? key, this.task}) : super(key: key);

   Task? task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(task!.taskImage),
          const SizedBox(height: 20),
          Text(
             task!.taskName,
             style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      )
    );
  }
}
