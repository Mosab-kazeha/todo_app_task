import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_task/component/utility_component.dart';
import 'package:todo_app_task/custom_search.dart';
import 'package:todo_app_task/model/todo_model.dart';
import 'package:todo_app_task/service/todo_service.dart';
import 'tasks_screeen.dart';

class CategoryTodoScreen extends StatefulWidget {
  CategoryTodoScreen({Key? key}) : super(key: key);

  @override
  State<CategoryTodoScreen> createState() => _CategoryTodoScreenState();
}

class _CategoryTodoScreenState extends State<CategoryTodoScreen>
    with UtilityComponent {
  TextEditingController titleTextController = TextEditingController();

  late String taskId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isDismissible: false,
              builder: (context) {
                return Container(
                  width: double.maxFinite,
                  height: 208,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 317,
                        height: 54,
                        child: TextField(
                          controller: titleTextController,
                          decoration: InputDecoration(
                              hintText: 'group name',
                              hintStyle: TextStyle(
                                color: Color(0xFF999999),
                                fontSize: 18,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w300,
                                height: 0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                        ),
                        decoration: ShapeDecoration(
                          color: Color(0xFFF5F4F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Todo().createNewTodo(
                              newTodo: TodoModel(
                                  title: titleTextController.text,
                                  tasks: [],
                                  deadLine: 1703333444,
                                  dateCreated: 1703333444,
                                  deliveryTime: 1,
                                  type: "1",
                                  importance: 1),
                            );
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 317,
                          height: 54,
                          child: Center(
                            child: Text(
                              'create task',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                          decoration: ShapeDecoration(
                            color: Color(0xFF8AA7B4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                    ),
                  ),
                );
              });
        },
        icon: Icon(
          Icons.add_circle_outline,
          color: Color(0xFF8AA7B4),
          size: 65,
          weight: 5,
        ),
      ),
      appBar: AppBar(
        title: Text('search'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              dynamic titleOfTodo = await Todo().getAllTitleTodo();

              showSearch(
                context: context,
                delegate:
                    CustomSearch(allData: titleOfTodo /*, taskId: taskId*/),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: Todo().getAllTodo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<TodoModel> todo = snapshot.data!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35, bottom: 50),
                    child: Text(
                      'Lists',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 34,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 240,
                            childAspectRatio: 3 / 2.5,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: todo.length,
                          itemBuilder: (context, index) {
                            taskId = todo[index].id.toString();
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TasksScreen(
                                      todoId: todo[index].id.toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 142,
                                height: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 20),
                                      child: Text(
                                        todo[index].title.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10),
                                      child: Text(
                                        '${todo[index].tasks!.length} task - 0 completed',
                                        style: TextStyle(
                                          color: Color(0xFF999999),
                                          fontSize: 12,
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10),
                                      child: Container(
                                        width: 116,
                                        height: 5,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFD2D2D2),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: LinearProgressIndicator(
                                          color: Color(0xFF8AA7B4),
                                          value: 0.5,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF8AA7B4),
                ),
              );
            } else {
              return Center(
                child: Text(
                  'There Is No Internet',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 34,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              );
            }
          }),
    );
  }
}
