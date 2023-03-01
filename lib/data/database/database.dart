import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
part 'database.g.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get deviceName => text().withLength(min: 0, max: 255)();
  RealColumn get rate => real()();
  TextColumn get price => text().withLength(min: 0, max: 255)();
  TextColumn get imgUrl => text().withLength(min: 0, max: 255)();
}

class Users extends Table {
  @override
  Set<Column> get primaryKey => {email};
  TextColumn get email => text().withLength(min: 0, max: 255)();
  TextColumn get password => text().withLength(min: 0, max: 255)();
}

class Sessions extends Table {
  @override
  Set<Column> get primaryKey => {isLoggedIn};
  TextColumn get isLoggedIn => text().withLength(min: 0, max: 255)();
  BoolColumn get flag => boolean()();
}

@DriftDatabase(tables: [Products, Users, Sessions])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
