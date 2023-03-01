import 'package:concung_entrance_test/data/repository/user_repository.dart';
import 'package:concung_entrance_test/utils/custom_exception.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

enum LoginStatus { initial, loading, done, fail }

class LoginState {
  late final String? email;
  late final String? password;
  late final String? errorMessage;
  late final LoginStatus? loginStatus;
  LoginState({
    this.email,
    this.password,
    this.errorMessage,
    this.loginStatus,
  });
  LoginState copyWith({
    String? email,
    String? password,
    String? errorMessage,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        loginStatus: loginStatus ?? this.loginStatus,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  LoginState.initial() {
    email = "";
    errorMessage = "";
    password = "";
    loginStatus = LoginStatus.initial;
  }
}

class LoginProvider extends StateNotifier<LoginState> {
  LoginProvider() : super(LoginState.initial());
  final instance = UserRepositoryImpl.instance();
  Future<void> login(String email, String password) async {
    try {
      state = state.copyWith(loginStatus: LoginStatus.loading);
      await Future.delayed(const Duration(
        seconds: 2,
      ));
      final response = await instance.login(email, password);
      if (response) {
        state = state.copyWith(loginStatus: LoginStatus.done);
      } else {
        state = state.copyWith(
          loginStatus: LoginStatus.done,
          errorMessage: "Login fail!",
        );
      }
    } on LocalException catch (error) {
      state = state.copyWith(
        loginStatus: LoginStatus.fail,
        errorMessage: error.errorMessage,
      );
    }
  }

  void setInitial() => state = LoginState.initial();
}
