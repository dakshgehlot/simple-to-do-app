import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({Key? key, this.title, this.desc}) : super(key: key);

  final String? title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24
      ),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? "(Unnamed Task)",
          style: TextStyle(
            color: Color(0xFF211551),
            fontSize: 22.0,
            fontWeight: FontWeight.bold
          ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(desc ?? "No description added.",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF868290),
              height: 1.5
            )
            ),
          )
        ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key, this.text, required this.isDone}) : super(key: key);

  final String? text;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              color: isDone ? Color(0xFF7349FE): Colors.transparent,
              borderRadius: BorderRadius.circular(6.0),
              border: isDone? null : Border.all(
                color: Color(0xFF868290),
                width: 1.5
              )

            ),
            child: Image(
              image: AssetImage(
                'assets/images/check_icon.png',
              ),
            ),
          ),
          Text(text ?? '(Unnamed ToDo)',
          style: TextStyle(
            color: isDone ? Color(0xFF211551) : Color(0xFF868290),
            fontSize: 16.0,
            fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
          ),
          )
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
