part of 'content_bloc.dart';

class ContentState extends Equatable {
  final StateAppEnum stateApp;
  final bool navigateToLogin;

  const ContentState({required this.stateApp, required this.navigateToLogin});

  const ContentState.defaultObj()
    : this(stateApp: StateAppEnum.initial, navigateToLogin: false);

  ContentState copyWith({StateAppEnum? stateApp, bool? navigateToLogin}) {
    return ContentState(
      stateApp: stateApp ?? this.stateApp,
      navigateToLogin: navigateToLogin ?? this.navigateToLogin,
    );
  }

  @override
  List<Object?> get props => [stateApp, navigateToLogin];
}
