import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/app/models/todo_model.dart';
import 'package:todolist/app/repositories/todos_repository.dart';
import 'package:collection/collection.dart';

class HomeController extends ChangeNotifier {
  final TodosRepository repository;
  var dateFormat = DateFormat('dd/MM/yyyy');
  int selectedTab = 1;
  DateTime daySelected;
  DateTime startFilter;
  DateTime endFilter;
  Map<String, List<TodoModel>> listTodos;

  HomeController({@required this.repository}) {
    findAllForWeek();
  }

  Future<void> findAllForWeek() async {
    daySelected = DateTime.now();
    startFilter = DateTime.now();

    if (startFilter.weekday != DateTime.monday) {
      startFilter =
          startFilter.subtract(Duration(days: (startFilter.weekday - 1)));
    }

    endFilter = startFilter.add(Duration(days: 6));

    var todos = await repository.findByPeriod(startFilter, endFilter);

    if (todos.isEmpty) {
      listTodos = {dateFormat.format(DateTime.now()): []};
    } else {
      listTodos =
          groupBy(todos, (TodoModel todo) => dateFormat.format(todo.dataHora));
    }

    notifyListeners();
  }

  Future<void> changeSelectedTab(BuildContext context, int index) async {
    selectedTab = index;
    switch (index) {
      case 0:
        filterFinalized();
        break;
      case 1:
        findAllForWeek();
        break;
      case 2:
        var day = await showDatePicker(
          context: context,
          initialDate: daySelected,
          firstDate: DateTime.now().subtract(Duration(days: (360 * 3))),
          lastDate: DateTime.now().add(Duration(days: (360 * 10))),
        );

        if (day != null) {
          daySelected = day;
          findTodosBySelectedDay();
        }
        break;
    }
    notifyListeners();
  }

  void checkOrUncheck(TodoModel todo) {
    todo.finalizado = !todo.finalizado;
    notifyListeners();
    repository.checkOrUncheckTodo(todo);
  }

  void filterFinalized() {
    listTodos = listTodos.map((key, value) {
      var todosFinalized = value.where((t) => t.finalizado).toList();
      return MapEntry(key, todosFinalized);
    });
    notifyListeners();
  }

  Future<void> findTodosBySelectedDay() async {
    var todos = await repository.findByPeriod(daySelected, daySelected);

    if (todos.isEmpty) {
      listTodos = {dateFormat.format(daySelected): []};
    } else {
      listTodos =
          groupBy(todos, (TodoModel todo) => dateFormat.format(todo.dataHora));
    }

    notifyListeners();
  }

  void update() {
    if (selectedTab == 1) {
      findAllForWeek();
    } else if (selectedTab == 2) {
      findTodosBySelectedDay();
    }
  }
}
