import 'package:todo_app_task/model/todo_model.dart';
import 'package:todo_app_task/service/base_service.dart';

abstract class TodoService extends BaseService {
  Future<List<TodoModel>> getAllTodo();
  Future<TodoModel> getOneTodo();
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
  Future<List<TodoModel>> getAllTodo() {
    // TODO: implement getAllTodo
    throw UnimplementedError();
  }

  @override
  Future<TodoModel> getOneTodo() {
    // TODO: implement getOneTodo
    throw UnimplementedError();
  }

  @override
  updateOldTodo({required String id, required TodoModel newTodo}) {
    // TODO: implement updateOldTodo
    throw UnimplementedError();
  }
}
