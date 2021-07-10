import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/database/connection.dart';
import 'package:todolist/app/database/database_adm_connection.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
import 'package:todolist/app/modules/home/home_page.dart';
import 'package:todolist/app/modules/new_task/new_task_controller.dart';
import 'package:todolist/app/modules/new_task/new_task_page.dart';
import 'package:todolist/app/repositories/todos_repository.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

// WidgetsBindingObserver observa o ciclo de vida do componente
class _AppState extends State<App> {
  DatabaseAdmConnection admConnection = DatabaseAdmConnection();
  @override
  void initState() {
    super.initState();
    Connection().instance;
    WidgetsBinding.instance.addObserver(admConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(admConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => TodosRepository(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFFFF9129),
          buttonColor: Color(0xFFFF9129),
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        routes: {
          NewTaskPage.routerName: (_) => ChangeNotifierProvider(
              create: (context) {
                var repository = context.read<TodosRepository>();
                return NewTaskController(repository: repository);
              },
              child: NewTaskPage()),
        },
        home: ChangeNotifierProvider(
            create: (context) {
              var repository = context.read<TodosRepository>();
              return HomeController(repository: repository);
            },
            child: HomePage()),
      ),
    );
  }
}
