import 'package:flutter/material.dart';
import 'package:to_do_list/custom_views/custom_button.dart';
import 'package:to_do_list/custom_views/custom_texfield.dart';
import 'package:to_do_list/views/main_page.dart';

import '../models/task.dart';

class CustomBottomSheet extends StatelessWidget {
   CustomBottomSheet({Key? key, this.task}) : super(key: key);

  final Task? task;
  final textController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200,
      color: const Color.fromARGB(255, 229, 229, 229),
      child: Column(
        children: [
          CustomTextField(
            marginSize: 20,
            secure: false,
            hintText: 'Task Name',
            borderStyle: const OutlineInputBorder(),
            initialValue: task?.taskName,
            // onChanged: (p0) => print(textController.text),
          ),
          const CustomButton(
            text: 'Save',
          )
        ],
      ),
    );
  }
}
