import 'package:flutter/material.dart';

class Task {
  String taskName;
  Icon? taskIcon;
  String taskImage;
  int? ap;

  Task({
    required this.taskName,
    required this.taskIcon,
    required this.taskImage
  });

}

List<Task> tasksList = [
  Task(
      taskName: 'buy',
      taskIcon: Icon(Icons.add_business_outlined),
      taskImage: 'images/buy.png'
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
      taskImage: 'images/study.jpg'
  ),
  Task(
    taskName: 'sleep',
    taskIcon: Icon(Icons.airline_seat_legroom_extra),
   taskImage: 'images/sleep.webp'
  ),
  Task(
      taskName: 'session',
      taskIcon: Icon(Icons.group),
      taskImage: 'images/session.jpg'
  )
];
