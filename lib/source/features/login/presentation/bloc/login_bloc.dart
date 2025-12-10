import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tecnical_task/source/core/bloc/network/network_bloc.dart';
import 'package:tecnical_task/source/core/services/shared_preferences_service.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';
import 'package:tecnical_task/source/core/values/enums/state_app_enum.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final NetworkBloc networkBloc;
  final SharedPreferencesService sharedPreferencesService;

  LoginBloc({required this.networkBloc, required this.sharedPreferencesService})
    : super(LoginState.defaultObj()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  /// To check error messages in user name
  void _onUsernameChanged(event, emit) {
    emit(
      state.copyWith(
        username: event.username,
        usernameError: null,
        errorMessage: null,
      ),
    );
  }

  /// To check error messages in password
  void _onPasswordChanged(event, emit) {
    emit(
      state.copyWith(
        password: event.password,
        passwordError: null,
        errorMessage: null,
      ),
    );
  }

  /// To toggle password visibility
  void _onPasswordVisibilityToggled(event, emit) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  /// To check credentials and navigate to content if success
  Future<void> _onLoginSubmitted(event, emit) async {
    // Validate fields
    String? usernameError;
    String? passwordError;

    if (state.username.trim().isEmpty) {
      usernameError = AppStrings.requiredUsername;
    }

    if (state.password.trim().isEmpty) {
      passwordError = AppStrings.requiredPassword;
    }

    if (usernameError != null || passwordError != null) {
      emit(
        state.copyWith(
          usernameError: usernameError,
          passwordError: passwordError,
        ),
      );
      return;
    }

    // Check network connection
    networkBloc.add(NetworkCheckRequested());

    // Wait a bit for the network check to complete
    await Future.delayed(const Duration(milliseconds: 300));

    final networkState = networkBloc.state;
    if (!networkState.isConnected) {
      emit(state.copyWith(errorMessage: AppStrings.noInternetConnection));
      return;
    }

    // Start loading
    emit(state.copyWith(stateApp: StateAppEnum.loading, errorMessage: null));

    // Simulate API call with 2-3 second delay
    await Future.delayed(const Duration(seconds: 2));

    // Check credentials
    if (state.username == 'test' && state.password == '12345') {
      // Save login state
      await sharedPreferencesService.setLoggedIn(true);
      // Success
      emit(
        state.copyWith(stateApp: StateAppEnum.success, navigateToContent: true),
      );
    } else {
      // Failure
      emit(
        state.copyWith(
          stateApp: StateAppEnum.failure,
          errorMessage: AppStrings.invalidCredentials,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    state.usernameController.dispose();
    state.passwordController.dispose();
    return super.close();
  }
}
