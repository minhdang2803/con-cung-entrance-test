import 'package:concung_entrance_test/data/repository/user_repository.dart';
import 'package:concung_entrance_test/utils/custom_exception.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_provider.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.done() = _Done;
  const factory RegisterState.error(String errorText) = _Error;
  const factory RegisterState.loading() = _Loading;
}

class RegisterProvider extends StateNotifier<RegisterState> {
  RegisterProvider() : super(const RegisterState.initial());
  final instance = UserRepositoryImpl.instance();
  void register() async {
    try {
      state = const RegisterState.loading();
      final response = await instance.register();
      if (response) {
        state = const RegisterState.done();
      } else {
        state = const RegisterState.error("Fail to register!");
      }
    } on LocalException catch (error) {
      state = RegisterState.error(error.errorMessage);
    }
  }
}
