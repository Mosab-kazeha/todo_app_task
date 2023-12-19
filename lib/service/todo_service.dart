import 'package:dio/dio.dart';
import 'package:todo_app_task/model/todo_model.dart';
import 'package:todo_app_task/service/base_service.dart';

abstract class TodoService extends BaseService {
  Future<List<TodoModel>> getAllTodo();
  Future<TodoModel> getOneTodo({required String id});
  createNewTodo({required TodoModel newTodo});
  updateOldTodo({required String id, required TodoModel newTodo});
  deleteTodo({required String id});
}

class Todo extends TodoService {
  @override
  createNewTodo({required TodoModel newTodo}) async {
    Response response = await dio.put(baseUrl, data: newTodo.toJson());
  }

  @override
  deleteTodo({required String id}) async {
    Response response = await dio.delete("$baseUrl/$id");
  }

  @override
  Future<List<TodoModel>> getAllTodo() async {
    Response response = await dio.get(baseUrl);

    dynamic temp = response.data;
    List<TodoModel> result =
        List.generate(temp.length, (index) => TodoModel.fromMap(temp[index]));

    return result;
  }

  @override
  Future<TodoModel> getOneTodo({required String id}) async {
    Response response = await dio.get("$baseUrl/$id");
    dynamic temp = response.data;
    TodoModel result = TodoModel.fromMap(temp);

    return result;
  }

  @override
  updateOldTodo({required String id, required TodoModel newTodo}) async {
    Response response = await dio.put("$baseUrl/$id", data: newTodo.toJson());
  }
}
