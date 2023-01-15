import 'package:flutter/material.dart';
import '../models/task.dart';
import 'custom_button.dart';
import 'custom_texfield.dart';

class CustomBottomSheet extends StatefulWidget {
      CustomBottomSheet({Key? key, this.task}) : super(key: key);

  Task? task;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String? editedTask;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
      color: const Color.fromARGB(255, 229, 229, 229),
      child: Column(
        children: [
          CustomTextField(
            marginSize: 20,
            secure: false,
            hintText: 'Task Name',
            borderStyle: const OutlineInputBorder(),
            initialValue: widget.task?.taskName,
            onChanged: (value) {
              editedTask = value!;
            },
          ),
          CustomButton(
            text: 'Save',
            onPressed: () {
              Navigator.pop(context, editedTask);

              // setState(() {
              //   Navigator.pop(context, editedTask);
              // });
            },
          )
        ],
      ),
    );
  }
}
