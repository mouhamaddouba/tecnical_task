import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tecnical_task/source/core/values/enums/state_app_enum.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.defaultObj()) {}

  @override
  Future<void> close() {
    state.usernameController.dispose();
    state.passwordController.dispose();
    return super.close();
  }
}
