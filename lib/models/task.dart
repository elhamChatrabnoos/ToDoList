
import 'package:hive/hive.dart';
part 'task.g.dart';

//??
@HiveType(typeId: 0)
class Task extends HiveObject {

  @HiveField(0)
  int? Id;

  @HiveField(1)
  String taskName;

  // @HiveField(2)
  // int taskIcon;

  @HiveField(2)
  String taskImage;

  Task({
    required this.taskName,
    // required this.taskIcon,
    required this.taskImage
  });

}


