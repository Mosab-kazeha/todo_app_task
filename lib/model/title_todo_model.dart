import 'dart:convert';

class TitleTodoModel {
  String? title;

  TitleTodoModel({
    this.title,
  });

  TitleTodoModel copyWith({
    String? title,
  }) =>
      TitleTodoModel(
        title: title ?? this.title,
      );

  factory TitleTodoModel.fromJson(String str) =>
      TitleTodoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TitleTodoModel.fromMap(Map<String, dynamic> json) => TitleTodoModel(
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
      };
}
