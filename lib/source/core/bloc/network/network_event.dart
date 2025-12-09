part of 'network_bloc.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object?> get props => [];
}

/// No Params
class NetworkCheckRequested extends NetworkEvent {}

class NetworkListenStarted extends NetworkEvent {}

/// Params
class NetworkStatusChanged extends NetworkEvent {
  final List<ConnectivityResult> connectivityResults;

  const NetworkStatusChanged({required this.connectivityResults});

  @override
  List<Object?> get props => [connectivityResults];
}
