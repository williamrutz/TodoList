import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/modules/new_task/new_task_controller.dart';
import 'package:todolist/app/shared/time_component.dart';

class NewTaskPage extends StatelessWidget {
  static String routerName = '/new';

  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskController>(builder: (context, controller, _) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nova Task',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Data',
                  style: TextStyle(
                      color: Colors.grey[800], fontWeight: FontWeight.bold),
                ),
                Text(
                  '10/07/2021',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nome da Task',
                  style: TextStyle(
                      color: Colors.grey[800], fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Hora',
                  style: TextStyle(
                      color: Colors.grey[800], fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TimeComponent(),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        // boxShadow: [
                        //   BoxShadow(
                        //       blurRadius: 30,
                        //       color: Theme.of(context).primaryColor)
                        // ],
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Salvar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
