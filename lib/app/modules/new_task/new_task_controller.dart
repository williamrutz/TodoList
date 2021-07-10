import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:todolist/app/repositories/todos_repository.dart';

class NewTaskController extends ChangeNotifier {
  var formkey = GlobalKey<FormState>();
  final TodosRepository repository;
  DateTime daySelected;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  TextEditingController nomeTaskController = TextEditingController();
  bool saved = false;
  bool loading = false;
  String error;

  String get dayFormated => dateFormat.format(daySelected);

  NewTaskController({@required this.repository, String day}) {
    daySelected = dateFormat.parse(day);
  }

  Future<void> save() async {
    try {
      if (formkey.currentState.validate()) {
        loading = true;
        saved = false;
        await repository.saveTodo(daySelected, nomeTaskController.text);
        loading = false;
        saved = true;
      }
    } catch (e) {
      print(e);
      error = 'Erro ao salvar Todo';
    }

    notifyListeners();
  }
}
