import 'dart:convert';
import 'package:flutter/material.dart';

class Task {
  String taskName;
  IconData? taskIcon;
  String taskImage;
  int? ap;

  Task({
    required this.taskName,
    required this.taskIcon,
    required this.taskImage
  });

  factory Task.fromMap(Map<String, dynamic> jsonData) {
    return Task(
      taskName: jsonData['taskName'],
      taskImage: jsonData['taskImage'],
      taskIcon: jsonData['taskIcon'],
    );
  }

  static Map<String, dynamic> toMap(Task task) => {
    'taskName' : task.taskName,
    'taskImage' : task.taskImage,
    'taskIcon' : task.taskIcon,
  };

  static String encode(List<Task> tasks) =>
      json.encode(tasks.map<Map<String, dynamic>>((task) =>
          Task.toMap(task)).toList(),
  );

  static List<Task> decode(String tasks) =>
      (json.decode(tasks) as List<dynamic>).map<Task>((item) =>
          Task.fromMap(item)).toList();

}


List<Task> tasksList = [
  Task(
      taskName: 'buy',
      taskIcon: Icons.add_business_outlined,
      taskImage: 'assets/images/buy.png'
  ),
  Task(
      taskName: 'excersice',
      taskIcon: Icons.directions_run_outlined,
      taskImage: 'assets/images/excersice.webp'
  ),
  Task(
      taskName: 'work',
      taskIcon: Icons.work,
      taskImage: 'assets/images/work.jpg'
  ),
  Task(
      taskName: 'study',
      taskIcon: Icons.book,
      taskImage: 'assets/images/study.jpg'
  ),
  Task(
      taskName: 'sleep',
      taskIcon: Icons.airline_seat_legroom_extra,
      taskImage: 'assets/images/sleep.webp'
  ),
  Task(
      taskName: 'session',
      taskIcon: Icons.group,
      taskImage: 'assets/images/session.jpg'
  )
];

