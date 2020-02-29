import 'package:flutter/Material.dart';
import 'package:todoApp/models/task.dart';
import 'package:todoApp/widgets/task_tile.dart';

class TaskList extends StatefulWidget {

 final List<Task> tasks;
TaskList(this.tasks);
  
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            checkboxCallback: (checkboxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
