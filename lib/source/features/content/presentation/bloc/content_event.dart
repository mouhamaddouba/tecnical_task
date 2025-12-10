part of 'content_bloc.dart';

abstract class ContentEvent extends Equatable {
  const ContentEvent();

  @override
  List<Object?> get props => [];
}

/// No Params
class ContentFetched extends ContentEvent {}

class ContentRetried extends ContentEvent {}

class ContentRefreshed extends ContentEvent {}

class LogoutEvent extends ContentEvent {}
