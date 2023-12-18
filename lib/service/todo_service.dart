import 'package:dio/dio.dart';
import 'package:todo_app_task/model/todo_model.dart';
import 'package:todo_app_task/service/base_service.dart';

abstract class TodoService extends BaseService {
  /*Future<List<TodoModel>>*/ getAllTodo();
  Future<TodoModel> getOneTodo({required String id});
  createNewTodo({required TodoModel newTodo});
  updateOldTodo({required String id, required TodoModel newTodo});
  deleteTodo(String id);
}

class Todo extends TodoService {
  @override
  createNewTodo({required TodoModel newTodo}) {
    // TODO: implement createNewTodo
    throw UnimplementedError();
  }

  @override
  deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  /* Future<List<TodoModel>>*/ getAllTodo() async {
    print(" enter to getAllTodo ");
    Response response =
        await dio.get("https://657ec9263e3f5b18946421b8.mockapi.io/todo");
    print(" get the response $response");
    return response;
  }

  @override
  Future<TodoModel> getOneTodo({required String id}) async {
    Response response = await dio.get("$baseUrl/$id");
    dynamic temp = response.data;
    TodoModel result = TodoModel.fromMap(temp.data[id]);

    print("hi $result");
    return result;
  }

  @override
  updateOldTodo({required String id, required TodoModel newTodo}) {
    // TODO: implement updateOldTodo
    throw UnimplementedError();
  }
}
