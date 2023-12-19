import 'package:dio/dio.dart';
import 'package:todo_app_task/model/title_todo_model.dart';
import 'package:todo_app_task/service/base_service.dart';

abstract class TitleTodoService extends BaseService {
  GetAllTitleTodo();
}

class TitleTodo extends TitleTodoService {
  @override
  GetAllTitleTodo() async {
    Response response = await dio.get("$baseUrl");
    dynamic temp = response.data;
    List<String> result = List.generate(
      temp.length,
      (index) => TitleTodoModel.fromMap(temp[index]).title!,
    );
    return result.toList();
  }
}
