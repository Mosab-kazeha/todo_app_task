import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
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
              /*dynamic titleOfTodo = await TitleTodo().GetAllTitleTodo();

              showSearch(
                context: context,
                delegate: CustomSearch(allData: titleOfTodo),
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
              '12 task - 0 completed',
              style: TextStyle(
                color: Color(0xFF999999),
                fontSize: 12,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Container(
              width: 317 /* MediaQuery.of(context).size.width */,
              height: 46,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              /*child: TextField(
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
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}
