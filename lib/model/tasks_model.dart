import 'dart:convert';

class TasksModel {
  bool? isComplete;
  String? taskTitle;

  TasksModel({
    this.isComplete,
    this.taskTitle,
  });

  TasksModel copyWith({
    bool? isComplete,
    String? taskTitle,
  }) =>
      TasksModel(
        isComplete: isComplete ?? this.isComplete,
        taskTitle: taskTitle ?? this.taskTitle,
      );

  factory TasksModel.fromJson(String str) =>
      TasksModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TasksModel.fromMap(Map<String, dynamic> json) => TasksModel(
        isComplete: json["isComplete"],
        taskTitle: json["taskTitle"],
      );

  Map<String, dynamic> toMap() => {
        "isComplete": isComplete,
        "taskTitle": taskTitle,
      };
}
