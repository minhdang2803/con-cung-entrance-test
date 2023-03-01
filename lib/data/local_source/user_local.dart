import 'package:concung_entrance_test/utils/extension.dart';
import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';

import '../../utils/custom_exception.dart';
import '../database/database.dart';

class UserLocal {
  final instance = GetIt.instance;

  Future<bool> loginWithEmail(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return Future.value(false);
    }
    final db = instance.get<MyDatabase>();
    final user = await (db.select(db.users)
          ..where((tbl) {
            final exp1 = tbl.email.equals("concung@gmail.com");

            final exp2 = tbl.password.equals("concung123".generateMD5());

            return exp1 & exp2;
          }))
        .get()
        .onError(
          (error, stackTrace) =>
              throw LocalException(LocalException.unkownUser, "Login fail!"),
        );
    if (user.isNotEmpty &&
        user.first.email == email &&
        user.first.password == password.generateMD5()) {
      await db.into(db.sessions).insertOnConflictUpdate(
            const SessionsCompanion(
              isLoggedIn: Value("isLoggedIn"),
              flag: Value(true),
            ),
          );
      return Future.value(true);
    } else {
      throw LocalException(
          LocalException.unkownUser, 'Wrong email or password!');
    }
  }

  Future<bool> registerWithEmail() async {
    bool result = true;
    final db = instance.get<MyDatabase>();
    final entry = UsersCompanion(
      email: const Value("concung@gmail.com"),
      password: Value("concung123".generateMD5()),
    );
    await db.into(db.users).insert(entry).onError(
          (error, stackTrace) => throw LocalException(
            LocalException.other,
            'Email is already registered!',
          ),
        );
    return Future.value(result);
  }

  Future<bool> getSession() async {
    bool result = true;
    final db = instance.get<MyDatabase>();
    final selectQuery = db.select(db.sessions)
      ..where((tbl) => tbl.isLoggedIn.equals("isLoggedIn"));
    final records = await selectQuery.get();
    if (records.isEmpty) {
      result = false;
    } else {
      result = true;
    }
    return Future.value(result);
  }
}
