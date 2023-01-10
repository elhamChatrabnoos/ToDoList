import '../models/task.dart';

class DataAccess {

  void insertTask(Task task){
    tasksList.add(task);
  }

  void deleteTask(Task task){
    tasksList.remove(task);
  }

  void updateTask(int taskIndex, Task editedTask){
    tasksList[taskIndex] = editedTask;
  }

}