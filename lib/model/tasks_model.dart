import 'dart:convert';

class TasksModel {
  bool? isComplete;
  String? taskTitle;
  String? taskId;
  String? todoId;

  TasksModel({
    this.isComplete,
    this.taskTitle,
    this.taskId,
    this.todoId,
  });

  TasksModel copyWith({
    bool? isComplete,
    String? taskTitle,
    String? taskId,
    String? todoId,
  }) =>
      TasksModel(
        isComplete: isComplete ?? this.isComplete,
        taskTitle: taskTitle ?? this.taskTitle,
        taskId: taskId ?? this.taskId,
        todoId: todoId ?? this.todoId,
      );

  factory TasksModel.fromJson(String str) =>
      TasksModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TasksModel.fromMap(Map<String, dynamic> json) => TasksModel(
        isComplete: json["isComplete"] as bool,
        taskTitle: json["taskTitle"] as String,
        taskId: json["taskId"] as String,
        todoId: json["todoId"] as String,
      );

  Map<String, dynamic> toMap() => {
        "isComplete": isComplete,
        "taskTitle": taskTitle,
        "taskId": taskId,
        "todoId": todoId,
      };
}
