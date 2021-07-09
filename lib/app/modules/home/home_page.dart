import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController controller, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Atividades',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            backgroundColor: Colors.white,
          ),
          body: Container(
            child: ElevatedButton(
              onPressed: () => {
                Navigator.of(context).pushNamed('/new'),
              },
              child: Text("Mudar"),
            ),
          ),
        );
      },
    );
  }
}
