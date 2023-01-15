import 'package:flutter/material.dart';

class Task {
  String taskName;
  Icon? taskIcon;
  String taskImage;

  Task({
    required this.taskName,
    required this.taskIcon,
    required this.taskImage
  });

}

List<Task> tasksList = [
  Task(
      taskName: 'buy',
      taskIcon: Icon(Icons.shop),
      taskImage: 'images/store.png'
  ),
  Task(
    taskName: 'excersice',
    taskIcon: Icon(Icons.directions_run_outlined),
    taskImage: 'images/excersice.webp'
  ),
  Task(
      taskName: 'work',
      taskIcon: Icon(Icons.work),
      taskImage: 'images/work.jpg'
  ),
  Task(
      taskName: 'study',
      taskIcon: Icon(Icons.book),
      taskImage: 'images/work.jpg'
  ),
  Task(
    taskName: 'shop',
    taskIcon: Icon(Icons.add_business_outlined),
   taskImage: 'images/work.jpg'
  ),
  Task(
      taskName: 'session',
      taskIcon: Icon(Icons.group),
      taskImage: 'images/work.jpg'
  )
];
