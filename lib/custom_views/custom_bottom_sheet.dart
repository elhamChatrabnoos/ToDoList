import 'package:flutter/material.dart';
import 'package:to_do_list/core/constants.dart';
import 'package:to_do_list/core/variables.dart';
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

  // Task? newTask = Task(taskName: 'taskName', taskIcon: Icons.padding, taskImage: 'taskImage');
  String taskName = '';
  IconData taskIcon = Icons.close;

  Variables? variables;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    variables = Variables();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      color: const Color.fromARGB(255, 245, 207, 175),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextField(
            marginSize: 20,
            secure: false,
            hintText: 'Task Name',
            borderStyle: const OutlineInputBorder(),
            initialValue: widget.task?.taskName,
            onChanged: (value) {
              taskName = value!;
            },
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 50),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                  color: Colors.grey),
              padding: CustomSizes.littlePadding,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: Variables.iconsList!.length,
                itemBuilder: (context, index) => InkWell(
                  child: Container(
                    margin: CustomSizes.littlePadding,
                    padding: CustomSizes.littlePadding,
                    decoration: BoxDecoration(
                        border: variables!.itemSelected[index]
                            ? Border.all(width: 3, color: Colors.brown)
                            : null),
                    child: Icon(Variables.iconsList![index], color: Variables.iconsColor),
                  ),
                  onTap: () => setState(() {
                    variables!.itemSelected[index] = variables!.itemSelected[index] ? false : true;
                    taskIcon = variables!.itemSelected[index] ? Variables.iconsList![index] : Icons.close;
                  }),
                ),
              ),
            ),
          ),
          CustomSizes.littleHeight,
          CustomButton(
            text: 'Save',
            onPressed: () {
              // {'taskName':taskName, 'taskIcon':taskIcon}
              // Navigator.pop(context,Task(taskName: taskName, taskIcon: taskIcon, taskImage: taskImage) );
              Navigator.pop(context, {'taskName':taskName, 'taskIcon':taskIcon});
            },
          )
        ],
      ),
    );
  }
}
