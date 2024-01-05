import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_task/component/utility_component.dart';
import 'package:todo_app_task/model/tasks_model.dart';
import 'package:todo_app_task/service/tasks_service.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({Key? key, required this.todoId}) : super(key: key);

  String todoId;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> with UtilityComponent {
  TextEditingController titleTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Tasks().getAllTasks(idTodo: widget.todoId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TasksModel> tasks = snapshot.data!;
            return Scaffold(
              floatingActionButton: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
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
                                    Tasks().createNewTask(
                                        newTask: TasksModel(
                                            taskTitle: titleTextController.text,
                                            isComplete: false),
                                        idTodo: widget.todoId);
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
                      /*dynamic titleOfTasks =
                          await Tasks().getAllTitleTasks(idTodo: widget.todoId);*/

                      /*showSearch(
                          context: context,
                          delegate: CustomSearch(allData: titleOfTasks,todoId: todoId),
                        );*/
                    },
                  ),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: Color(0xFF8AA7B4),
                        fontSize: 34,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      '${tasks.length} task - 0 completed',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 12,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            key: UniqueKey(),
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              /*dismissible: DismissiblePane(onDismissed: () {
                                  setState(() {
                                    Tasks().deleteTask(
                                        idTodo: todoId,
                                        idTask: tasks[index].taskId!);
                                  });
                                }),*/
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    /* setState(() {
                                        tasks.removeAt(index);
                                      });*/

                                    setState(() {
                                      /*print(tasks.length);
                                        print(tasks);
                                        print('object');
*/
                                      Tasks().deleteTask(
                                          idTodo: widget.todoId,
                                          idTask: tasks[index].taskId!);
                                    });
                                  },
                                  backgroundColor: Colors.white,
                                  foregroundColor: Color(0xFFFE4A49),
                                  icon: Icons.delete_outline_rounded,
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Text(tasks[index].taskTitle!),
                              leading: Checkbox(
                                  activeColor: Color(0xFF8AA7B4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  value: tasks[index].isComplete,
                                  onChanged: (value) async {
                                    await Tasks().updateOldTask(
                                      idTodo: widget.todoId,
                                      idTask: tasks[index].taskId!,
                                      newTask: TasksModel(
                                          isComplete: !tasks[index].isComplete!,
                                          taskTitle: tasks[index].taskTitle,
                                          taskId: tasks[index].taskId,
                                          todoId: tasks[index].todoId),
                                    );
                                    setState(() {
                                      tasks[index].isComplete = value!;
                                    });
                                  }),
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF8AA7B4),
                ),
              ),
            );
          } else {
            return Scaffold(
              floatingActionButton: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
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
                                    Tasks().createNewTask(
                                        newTask: TasksModel(
                                            taskTitle: titleTextController.text,
                                            isComplete: false),
                                        idTodo: widget.todoId);
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
                      /*dynamic titleOfTasks =
                          await Tasks().getAllTitleTasks(idTodo: widget.todoId);*/

                      /*showSearch(
                          context: context,
                          delegate: CustomSearch(allData: titleOfTasks,todoId: todoId),
                        );*/
                    },
                  ),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: Color(0xFF8AA7B4),
                        fontSize: 34,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      '0 task - 0 completed',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 12,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  /*   Expanded(
                    child: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            key: UniqueKey(),
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              */ /*dismissible: DismissiblePane(onDismissed: () {
                                  setState(() {
                                    Tasks().deleteTask(
                                        idTodo: todoId,
                                        idTask: tasks[index].taskId!);
                                  });
                                }),*/ /*
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    */ /* setState(() {
                                        tasks.removeAt(index);
                                      });*/ /*

                                    setState(() {
                                      */ /*print(tasks.length);
                                        print(tasks);
                                        print('object');
*/ /*
                                      Tasks().deleteTask(
                                          idTodo: widget.todoId,
                                          idTask: tasks[index].taskId!);
                                    });
                                  },
                                  backgroundColor: Colors.white,
                                  foregroundColor: Color(0xFFFE4A49),
                                  icon: Icons.delete_outline_rounded,
                                ),
                              ],
                            ),
                            child: ListTile(
                              title: Text(tasks[index].taskTitle!),
                              leading: Checkbox(
                                  activeColor: Color(0xFF8AA7B4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  value: tasks[index].isComplete,
                                  onChanged: (value) async {
                                    await Tasks().updateOldTask(
                                      idTodo: widget.todoId,
                                      idTask: tasks[index].taskId!,
                                      newTask: TasksModel(
                                          isComplete: !tasks[index].isComplete!,
                                          taskTitle: tasks[index].taskTitle,
                                          taskId: tasks[index].taskId,
                                          todoId: tasks[index].todoId),
                                    );
                                    setState(() {
                                      tasks[index].isComplete = value!;
                                    });
                                  }),
                            ),
                          );
                        }),
                  )*/
                ],
              ),
            );
          }
        });
  }
}
