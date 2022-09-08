import 'package:flutter/material.dart';
import 'package:simple_todo_app/database_helper.dart';
import 'package:simple_todo_app/screens/taskpage.dart';
import 'package:simple_todo_app/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24 ),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 32.0, top: 32.0),
                    child: Image(
                      image: AssetImage('assets/images/logo.png')
                    ),
                  ),
                Expanded(
                  child: FutureBuilder(
                    initialData: [],
                    future: _dbHelper.getTask(),
                    builder: (context, AsyncSnapshot snapshot){
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                          itemBuilder: (context, index){
                            return TaskCardWidget(
                              title: snapshot.data[index].title,
                            );
                          }
                          );
                    },
                  ),
                )
              ],
            ),
              Positioned(
                bottom: 24,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TaskPage()))
                        .then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
                 width: 60,
                   height: 60,
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     colors: [Color(0xFF7349FE), Color(0xFF643FDE)],
                     begin: Alignment(0, -1.0),
                     end: Alignment(0.0, 1.0)
                   ),
                   borderRadius: BorderRadius.circular(20)
                 ),
                 child: Image(
                   image: AssetImage('assets/images/add_icon.png'),
                 )
               ),
             ),
           )
          ]
          )
        ),
      ),
    );
  }
}
