import 'dart:convert';

class TodoModel {
  String? title;
  int? dateCreated;
  int? deadLine;
  int? deliveryTime;
  String? type;
  int? importance;
  List<dynamic>? tasks;

  TodoModel({
    this.title,
    this.dateCreated,
    this.deadLine,
    this.deliveryTime,
    this.type,
    this.importance,
    this.tasks,
  });

  TodoModel copyWith({
    String? title,
    int? dateCreated,
    int? deadLine,
    int? deliveryTime,
    String? type,
    int? importance,
    List<dynamic>? tasks,
  }) =>
      TodoModel(
        title: title ?? this.title,
        dateCreated: dateCreated ?? this.dateCreated,
        deadLine: deadLine ?? this.deadLine,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        type: type ?? this.type,
        importance: importance ?? this.importance,
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
        tasks: json["tasks"] == null
            ? []
            : List<dynamic>.from(json["tasks"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "dateCreated": dateCreated,
        "deadLine": deadLine,
        "deliveryTime": deliveryTime,
        "type": type,
        "importance": importance,
        "tasks": tasks == null ? [] : List<dynamic>.from(tasks!.map((x) => x)),
      };
}
