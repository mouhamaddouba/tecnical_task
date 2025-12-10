import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tecnical_task/source/core/values/enums/state_app_enum.dart';
import 'package:tecnical_task/source/features/content/data/repositories/content_repository.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentRepository _contentRepository;

  ContentBloc({required ContentRepository contentRepository})
    : _contentRepository = contentRepository,
      super(ContentState.defaultObj()) {
    on<LogoutEvent>(_onLogoutEvent);
  }

  /// Clear session and navigate to login
  void _onLogoutEvent(event, emit) {
    emit(state.copyWith(stateApp: StateAppEnum.initial, navigateToLogin: true));
  }
}
