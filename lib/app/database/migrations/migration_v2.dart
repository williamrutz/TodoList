import 'package:sqflite/sqflite.dart';

void createV2(Batch batch) {
  batch.execute('''
    CREATE TABLE teste(
      id INTEGER PRIMARY KEY
    );
  ''');
}

void upgradeV2(Batch batch) {
  batch.execute('''
    CREATE TABLE teste(
      id INTEGER
    );
  ''');
}
