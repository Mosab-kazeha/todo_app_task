import 'dart:convert';

class TodoModel {
  String? title;
  int? dateCreated;
  int? deadLine;
  int? deliveryTime;
  String? type;
  int? importance;
  String? id;
  List<Task>? tasks;

  TodoModel({
    this.title,
    this.dateCreated,
    this.deadLine,
    this.deliveryTime,
    this.type,
    this.importance,
    this.id,
    this.tasks,
  });

  TodoModel copyWith({
    String? title,
    int? dateCreated,
    int? deadLine,
    int? deliveryTime,
    String? type,
    int? importance,
    String? id,
    List<Task>? tasks,
  }) =>
      TodoModel(
        title: title ?? this.title,
        dateCreated: dateCreated ?? this.dateCreated,
        deadLine: deadLine ?? this.deadLine,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        type: type ?? this.type,
        importance: importance ?? this.importance,
        id: id ?? this.id,
        tasks: tasks ?? this.tasks,
      );

  factory TodoModel.fromJson(String str) => TodoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
        title: json["title"],
        dateCreated: json["dateCreated"],
        deadLine: json["deadLine"],
        deliveryTime: json["deliveryTime"],
        type: json["type"],
        importance: json["importance"],
        id: json["id"],
        tasks: json["tasks"] == null
            ? []
            : List<Task>.from(json["tasks"]!.map((x) => Task.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "dateCreated": dateCreated,
        "deadLine": deadLine,
        "deliveryTime": deliveryTime,
        "type": type,
        "importance": importance,
        "id": id,
        "tasks": tasks == null
            ? []
            : List<dynamic>.from(tasks!.map((x) => x.toMap())),
      };
}

class Task {
  bool? isComplete;
  String? taskTitle;
  String? id;
  String? todoId;

  Task({
    this.isComplete,
    this.taskTitle,
    this.id,
    this.todoId,
  });

  Task copyWith({
    bool? isComplete,
    String? taskTitle,
    String? id,
    String? todoId,
  }) =>
      Task(
        isComplete: isComplete ?? this.isComplete,
        taskTitle: taskTitle ?? this.taskTitle,
        id: id ?? this.id,
        todoId: todoId ?? this.todoId,
      );

  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        isComplete: json["isComplete"],
        taskTitle: json["taskTitle"],
        id: json["id"],
        todoId: json["todoId"],
      );

  Map<String, dynamic> toMap() => {
        "isComplete": isComplete,
        "taskTitle": taskTitle,
        "id": id,
        "todoId": todoId,
      };
}
