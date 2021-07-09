import 'package:sqflite/sqflite.dart';

void createV1(Batch batch) {
  batch.execute('''
    CREATE TABLE todo(
      id INTEGER PRIMARY KEY,
      descricao VARCHAR(500) NOT NULL,
      data_hora DATETIME,
      finalizado INTEGER
    );
  ''');
}
