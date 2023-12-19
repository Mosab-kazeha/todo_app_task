import 'package:dio/dio.dart';
import 'package:todo_app_task/model/tasks_model.dart';
import 'package:todo_app_task/service/base_service.dart';

abstract class TasksService extends BaseService {
  Future<List<TasksModel>> getAllTasks({required String idTodo});
  Future<TasksModel> getOneTask(
      {required String idTodo, required String idTask});
  createNewTask({required TasksModel newTask, required String idTodo});
  updateOldTask(
      {required String idTodo,
      required String idTask,
      required TasksModel newTask});
  deleteTask({required String idTodo, required String idTask});
}

class Tasks extends TasksService {
  @override
  createNewTask({required TasksModel newTask, required String idTodo}) async {
    Response response =
        await dio.post("$baseUrl/$idTodo/$baseTaskUrl", data: newTask.toJson());
  }

  @override
  deleteTask({required String idTodo, required String idTask}) async {
    Response response =
        await dio.delete("$baseUrl/$idTodo/$baseTaskUrl/$idTask");
  }

  @override
  Future<List<TasksModel>> getAllTasks({required String idTodo}) async {
    Response response = await dio.get("$baseUrl/$idTodo/$baseTaskUrl");
    dynamic temp = response.data;
    List<TasksModel> result =
        List.generate(temp.length, (index) => TasksModel.fromMap(temp[index]));
    return result;
  }

  @override
  Future<TasksModel> getOneTask(
      {required String idTodo, required String idTask}) async {
    Response response = await dio.get("$baseUrl/$idTodo/$baseTaskUrl/$idTask");
    dynamic temp = response.data;
    TasksModel result = TasksModel.fromMap(temp);
    return result;
  }

  @override
  updateOldTask(
      {required String idTodo,
      required String idTask,
      required TasksModel newTask}) async {
    Response response = await dio.put("$baseUrl/$idTodo/$baseTaskUrl/$idTask",
        data: newTask.toJson());
  }
}
