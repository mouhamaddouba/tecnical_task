part of 'login_bloc.dart';

class LoginState extends Equatable {
  final StateAppEnum stateApp;
  final String username;
  final String password;
  final String? usernameError;
  final String? passwordError;
  final String? errorMessage;
  final bool navigateToContent;
  final bool obscurePassword;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginState({
    required this.stateApp,
    required this.username,
    required this.password,
    this.usernameError,
    this.passwordError,
    this.errorMessage,
    required this.navigateToContent,
    required this.obscurePassword,
    required this.usernameController,
    required this.passwordController,
  });

  LoginState.defaultObj()
    : this(
        stateApp: StateAppEnum.initial,
        username: '',
        password: '',
        navigateToContent: false,
        obscurePassword: true,
        usernameController: TextEditingController(),
        passwordController: TextEditingController(),
      );

  LoginState copyWith({
    StateAppEnum? stateApp,
    String? username,
    String? password,
    String? usernameError,
    String? passwordError,
    String? errorMessage,
    bool? navigateToContent,
    bool? obscurePassword,
    TextEditingController? usernameController,
    TextEditingController? passwordController,
  }) {
    return LoginState(
      stateApp: stateApp ?? this.stateApp,
      username: username ?? this.username,
      password: password ?? this.password,
      usernameError: usernameError,
      passwordError: passwordError,
      errorMessage: errorMessage,
      navigateToContent: navigateToContent ?? this.navigateToContent,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      usernameController: usernameController ?? this.usernameController,
      passwordController: passwordController ?? this.passwordController,
    );
  }

  @override
  List<Object?> get props => [
    stateApp,
    username,
    password,
    usernameError,
    passwordError,
    errorMessage,
    navigateToContent,
    obscurePassword,
    usernameController,
    passwordController,
  ];
}
