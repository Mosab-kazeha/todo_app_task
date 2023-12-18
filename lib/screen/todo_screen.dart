import 'package:flutter/material.dart';
import 'package:todo_app_task/model/todo_model.dart';
import 'package:todo_app_task/screen/tasks_screeen.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({
    Key? key,
    required this.todo,
    required this.search_todo_result,
  }) : super(key: key);

  late List<TodoModel> todo;
  late List<TodoModel> search_todo_result;

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 50),
            child: Container(
              width: 317 /* MediaQuery.of(context).size.width */,
              height: 46,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    widget.search_todo_result.clear();
                    widget.todo.forEach((element) {
                      if (element.title!.contains(value)) {
                        widget.search_todo_result.add(element);
                      }
                    });
                  });
                },
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 240,
                    childAspectRatio: 3 / 2.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: /*widget.search_todo_result.length == 0
                      ? widget.todo.length
                      :*/
                      widget.search_todo_result.length,
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
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child:
                                  /*widget.search_todo_result[index].title == null
                                      ? Text(
                                          widget.todo[index].title.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      : */
                                  Text(
                                widget.search_todo_result[index].title
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                '10 task - 5 completed',
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
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: SizedBox(
                                width: 116,
                                height: 5,
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
      ),
    );
  }
}
