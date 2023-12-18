import 'package:flutter/material.dart';
import 'package:todo_app_task/model/todo_model.dart';
import 'package:todo_app_task/service/todo_service.dart';

class ListTodoScreen extends StatelessWidget {
  const ListTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Todo().getAllTodo(),
          builder: (context, snapshot) {
            print(" try to get the data ");
            if (snapshot.hasData) {
              print(" data here ");
              dynamic temp = snapshot.data;
              List<TodoModel> result = List.generate(temp.data.length,
                  (index) => TodoModel.fromMap(temp.data[index]));
              return Center(
                child: Column(
                  children: [
                    Center(
                      child: Text(result[1].title!),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
