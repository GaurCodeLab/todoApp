import 'package:flutter/Material.dart';

import 'package:provider/provider.dart';
import 'package:todoApp/models/task_data.dart';
import 'package:todoApp/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Dismissible(
              key: UniqueKey(),
              child: TaskTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  }),
              onDismissed: (direction) {
                Provider.of<TaskData>(context).removeTask(task);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("$task dismissed"),
                  action: SnackBarAction(
                    label: "UNDO",
                    onPressed: () {
                      Provider.of<TaskData>(context)
                          .undoRemoveTask(index, task);
                    },
                  ),
                ));
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
