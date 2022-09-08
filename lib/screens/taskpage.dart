import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:simple_todo_app/database_helper.dart';
import 'package:simple_todo_app/models/Task.dart';
import 'package:simple_todo_app/widgets.dart';
import 'package:sqflite/sqflite.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 6.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Image(
                            image: AssetImage('assets/images/back_arrow_icon.png'),
                          ),
                        ),
                      ),
                      Expanded(child: TextField(
                        onSubmitted: (value) async {
                          if (value != ""){
                            DatabaseHelper _dbHelper = DatabaseHelper();
                            Task _newTask = Task(
                                title: value
                            );
                            await _dbHelper.insertTask(_newTask);
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Enter task title...",
                          border: InputBorder.none
                        ),
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF211551)
                        ),
                      ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter description",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 24.0)
                    ),
                  ),
                ),
                TodoWidget(
                  text: 'Create your first task',
                  isDone: false,
                ),
                TodoWidget(text: 'Create your first todo as well', isDone: false),
                TodoWidget(isDone: true),
                TodoWidget(isDone: true),
              ],
            ),
              Positioned(
                bottom: 24,
                right: 24,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TaskPage()));
                  },
                  child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color(0xFFFE3577),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Image(
                        image: AssetImage('assets/images/delete_icon.png'),
                      )
                  ),
                ),
              ),
          ]
          ),
        ),
      ),
    );
  }
}
