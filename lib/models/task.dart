import 'package:flutter/material.dart';

class Task {
  String taskName;
  Icon? taskIcon;

  Task({
    required this.taskName,
    required this.taskIcon});

}

List<Task> tasksList = [
  Task(
      taskName: 'buy',
      taskIcon: Icon(Icons.shop)
  ),
  Task(
    taskName: 'excersice',
    taskIcon: Icon(Icons.directions_run_outlined),
  ),
  Task(
      taskName: 'sleep',
      taskIcon: Icon(Icons.airline_seat_legroom_extra)
  ),
  Task(
      taskName: 'study',
      taskIcon: Icon(Icons.book)
  ),
  Task(
    taskName: 'shop',
    taskIcon: Icon(Icons.add_business_outlined),
  ),
  Task(
      taskName: 'session',
      taskIcon: Icon(Icons.group)
  )
];

