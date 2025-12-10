import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';
import 'package:tecnical_task/source/core/values/enums/state_app_enum.dart';
import 'package:tecnical_task/source/features/content/data/models/content_item_model.dart';
import 'package:tecnical_task/source/features/content/data/repositories/content_repository.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentRepository _contentRepository;

  ContentBloc({required ContentRepository contentRepository})
    : _contentRepository = contentRepository,
      super(ContentState.defaultObj()) {
    on<ContentFetched>(_onContentFetched);
    on<ContentRetried>(_onContentRetried);
    on<LogoutEvent>(_onLogoutEvent);
  }

  /// Fetch content from repository
  Future<void> _onContentFetched(event, emit) async {
    emit(state.copyWith(stateApp: StateAppEnum.loading));

    try {
      final items = await _contentRepository.fetchContent();
      emit(state.copyWith(stateApp: StateAppEnum.loaded, items: items));
    } catch (e) {
      emit(
        state.copyWith(
          stateApp: StateAppEnum.failure,
          errorMessage: AppStrings.networkError,
        ),
      );
    }
  }

  /// Retry fetching content if failed
  Future<void> _onContentRetried(
    ContentRetried event,
    Emitter<ContentState> emit,
  ) async {
    // Reset error and retry fetching
    emit(state.copyWith(stateApp: StateAppEnum.loading, errorMessage: null));

    try {
      final items = await _contentRepository.fetchContent();
      emit(state.copyWith(stateApp: StateAppEnum.loaded, items: items));
    } catch (e) {
      emit(
        state.copyWith(
          stateApp: StateAppEnum.failure,
          errorMessage: AppStrings.networkError,
        ),
      );
    }
  }

  /// Clear session and navigate to login
  void _onLogoutEvent(event, emit) {
    emit(state.copyWith(stateApp: StateAppEnum.initial, navigateToLogin: true));
  }
}
