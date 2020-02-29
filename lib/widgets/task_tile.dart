import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[500],
                  offset: Offset(5.0, 5.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5.0, -0.5),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ]),
        child: ListTile(
            title: Text(
              taskTitle,
              style: TextStyle(
                  decoration: isChecked ? TextDecoration.lineThrough : null),
            ),
            trailing: Checkbox(
              activeColor: Colors.lightBlueAccent,
              value: isChecked,
              onChanged: checkboxCallback,
            )),
      ),
    );
  }
}
