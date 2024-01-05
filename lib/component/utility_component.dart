import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_task/model/tasks_model.dart';

import '../service/tasks_service.dart';

mixin UtilityComponent {
  AddTodoOrTask(
      {required BuildContext context,
      required TextEditingController titleTextController,
      required Function(void Function()) setState}) {
    return showModalBottomSheet(
        isDismissible: false,
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
                    setState(() {});
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 317,
                    height: 54,
                    child: Center(
                      child: Text(
                        'create group',
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
  }
}
