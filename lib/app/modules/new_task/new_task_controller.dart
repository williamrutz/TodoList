import 'package:flutter/cupertino.dart';
import 'package:todolist/app/repositories/todos_repository.dart';

class NewTaskController extends ChangeNotifier {
  final TodosRepository repository;

  NewTaskController({@required this.repository});
}
