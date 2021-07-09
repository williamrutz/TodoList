import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/modules/new_task/new_task_controller.dart';

class NewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskController>(builder: (context, controller, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text("New Task"),
        ),
        body: Container(),
      );
    });
  }
}
