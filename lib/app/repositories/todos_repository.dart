import 'package:todolist/app/database/connection.dart';
import 'package:todolist/app/models/todo_model.dart';

class TodosRepository {
  Future<List<TodoModel>> findByPeriod(DateTime start, DateTime end) async {
    var startFilter = DateTime(start.year, start.month, start.day, 0, 0, 0);
    var endFilter = DateTime(end.year, end.month, end.day, 23, 59, 59);

    var conn = await Connection().instance;
    var result = await conn.rawQuery(
      "SELECT * FROM todo WHERE data_hora BETWEEN ? AND ? ORDER BY data_hora",
      [startFilter.toIso8601String(), endFilter.toIso8601String()],
    );

    return result.map((t) => TodoModel.fromMap(t)).toList();
  }

  Future<void> saveTodo(DateTime dataTimeTask, String descricao) async {
    var conn = await Connection().instance;
    await conn.rawInsert(
      "INSERT INTO todo VALUES(?,?,?,?)",
      [null, descricao, dataTimeTask.toIso8601String(), 0],
    );
  }

  Future<void> checkOrUncheckTodo(TodoModel todo) async {
    var conn = await Connection().instance;
    await conn.rawUpdate(
      "UPDATE todo SET finalizado = ? WHERE id = ?",
      [todo.finalizado ? 1 : 0, todo.id],
    );
  }
}
