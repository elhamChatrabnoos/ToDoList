import 'dart:core';

import 'package:hive/hive.dart';

import '../models/task.dart';
import 'keys.dart';

class DataAccess {

  void insertTask(Task task) {
    Hive.box<Task>(CustomKeys.taskListDb).add(task);
  }

  void deleteTask(Task task) {
    Hive.box<Task>(CustomKeys.taskListDb).delete(task);
  }

  void updateTask(int taskIndex, Task editedTask) {
    var task = Hive.box<Task>(CustomKeys.taskListDb).getAt(taskIndex);
    task = editedTask;
    task.save();
  }

}
