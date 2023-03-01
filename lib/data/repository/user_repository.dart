import 'package:concung_entrance_test/data/local_source/user_local.dart';

abstract class UserRepository {
  Future<bool> register();
  Future<bool> login(String userName, String password);
  Future<bool> getSession();
}

class UserRepositoryImpl implements UserRepository {
  late UserLocal _local;

  UserRepositoryImpl._privateConstructor() {
    _local = UserLocal();
  }
  static final UserRepositoryImpl _instance =
      UserRepositoryImpl._privateConstructor();
  factory UserRepositoryImpl.instance() => _instance;

  @override
  Future<bool> login(String email, String password) async {
    return await _local.loginWithEmail(email, password);
  }

  @override
  Future<bool> register() async {
    return await _local.registerWithEmail();
  }

  @override
  Future<bool> getSession() async {
    return await _local.getSession();
  }
}
