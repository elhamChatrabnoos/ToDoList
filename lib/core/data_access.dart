import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/core/variables.dart';
import '../models/task.dart';
import 'keys.dart';

class DataAccess {

  void insertTask(Task task) {
    tasksList.add(task);
  }

  void deleteTask(Task task) {
    tasksList.remove(task);
  }

  void updateTask(int taskIndex, Task editedTask) {
    tasksList[taskIndex] = editedTask;
  }

  // ???
  void defineSharedPreference() async {
    Variables.taskShPreference = await SharedPreferences.getInstance();
  }

  void addTaskToShPref() async {
    // Encode and store data in SharedPreferences
    final String encodedData = Task.encode(tasksList);
    await Variables.taskShPreference!.setString(CustomKeys.taskPrefKey, encodedData);
  }

  List<Task> readTaskFromShPrefs() {
    // Fetch and decode data
    final String? taskString = Variables.taskShPreference!.getString(CustomKeys.taskPrefKey);
    return Task.decode(taskString!);
  }

  Future<void> defineSharedPref() async {
    if(Variables.taskShPreference != null){
      final String? taskString = Variables.taskShPreference!.getString(CustomKeys.taskPrefKey);
      tasksList = Task.decode(taskString!);
    }
    else{
      Variables.taskShPreference = await SharedPreferences.getInstance();
      addTaskToShPref();
      tasksList = readTaskFromShPrefs();
    }
  }


}
