part of 'network_bloc.dart';

class NetworkState extends Equatable {
  final bool isLoading;
  final bool isConnected;

  const NetworkState({required this.isLoading, required this.isConnected});

  const NetworkState.defaultObj() : this(isLoading: false, isConnected: true);

  NetworkState copyWith({bool? isLoading, bool? isConnected}) {
    return NetworkState(
      isLoading: isLoading ?? this.isLoading,
      isConnected: isConnected ?? this.isConnected,
    );
  }

  @override
  List<Object?> get props => [isLoading, isConnected];
}
