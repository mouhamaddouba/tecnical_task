import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tecnical_task/source/features/content/data/repositories/content_repository.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  final ContentRepository _contentRepository;

  ContentBloc({required ContentRepository contentRepository})
    : _contentRepository = contentRepository,
      super(ContentInitial()) {
    on<ContentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
