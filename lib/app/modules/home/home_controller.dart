import 'package:flutter/cupertino.dart';
import 'package:todolist/app/repositories/todos_repository.dart';

class HomeController extends ChangeNotifier {
  final TodosRepository repository;

  var nome = 'Rutz';

  HomeController({@required this.repository});

  void onChangeName() {
    nome = 'William Rutz';
    notifyListeners();
  }
}
