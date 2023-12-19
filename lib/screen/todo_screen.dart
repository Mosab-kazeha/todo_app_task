import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_task/custom_search.dart';
import 'package:todo_app_task/model/todo_model.dart';
import 'package:todo_app_task/service/title_todo_service.dart';
import 'package:todo_app_task/service/todo_service.dart';
import 'tasks_screeen.dart';

class CategoryTodoScreen extends StatelessWidget {
  CategoryTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {},
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
              dynamic titleOfTodo = await TitleTodo().GetAllTitleTodo();

              showSearch(
                context: context,
                delegate: CustomSearch(allData: titleOfTodo),
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
                  /*Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 50),
                    child: Container(
                      width: 317 */ /* MediaQuery.of(context).size.width */ /*,
                      height: 46,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "search",
                          hintStyle: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 24,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w300,
                            height: 0.82,
                          ),
                          prefix: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ), // BorderSide
                          ), // OutlineInputBorder
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),*/
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
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TasksScreen(),
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
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF8AA7B4),
                ),
              );
            }
          }),
    );
  }
}
