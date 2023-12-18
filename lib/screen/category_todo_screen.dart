import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_task/model/todo_model.dart';
import 'package:todo_app_task/screen/todo_screen.dart';
import 'package:todo_app_task/service/todo_service.dart';

class CategoryTodoScreen extends StatelessWidget {
  CategoryTodoScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: FutureBuilder(
          future: Todo().getAllTodo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<TodoModel> search_todo_result = [];
              return TodoScreen(
                  todo: snapshot.data!, search_todo_result: search_todo_result);
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: Color(0xFF8AA7B4),
              ));
            }
          }),
    );
  }
}
