part of 'content_bloc.dart';

class ContentState extends Equatable {
  final StateAppEnum stateApp;
  final List<ContentItemModel> items;
  final String? errorMessage;
  final bool navigateToLogin;

  const ContentState({
    required this.stateApp,
    required this.items,
    this.errorMessage,
    required this.navigateToLogin,
  });

  const ContentState.defaultObj()
    : this(
        stateApp: StateAppEnum.initial,
        items: const [],
        errorMessage: null,
        navigateToLogin: false,
      );

  ContentState copyWith({
    StateAppEnum? stateApp,
    List<ContentItemModel>? items,
    String? errorMessage,
    bool? navigateToLogin,
  }) {
    return ContentState(
      stateApp: stateApp ?? this.stateApp,
      items: items ?? this.items,
      errorMessage: errorMessage,
      navigateToLogin: navigateToLogin ?? this.navigateToLogin,
    );
  }

  @override
  List<Object?> get props => [stateApp, items, errorMessage, navigateToLogin];
}
