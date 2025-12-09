import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  NetworkBloc() : super(NetworkState.defaultObj()) {
    on<NetworkCheckRequested>(_onNetworkCheckRequested);
    on<NetworkStatusChanged>(_onNetworkStatusChanged);
    on<NetworkListenStarted>(_onNetworkListenStarted);

    // Start listening to connectivity changes
    add(NetworkListenStarted());
  }

  /// To check network connection
  Future<void> _onNetworkCheckRequested(event, emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final connectivityResults = await _connectivity.checkConnectivity();
      final isConnected = _hasInternetConnection(connectivityResults);

      emit(state.copyWith(isLoading: false, isConnected: isConnected));
    } catch (e) {
      emit(state.copyWith(isLoading: false, isConnected: false));
    }
  }

  /// To listen to connectivity changes
  void _onNetworkStatusChanged(event, emit) {
    final isConnected = _hasInternetConnection(event.connectivityResults);

    emit(state.copyWith(isConnected: isConnected, isLoading: false));
  }

  /// To start listening to connectivity changes
  void _onNetworkListenStarted(event, emit) {
    // Check initial connectivity
    add(NetworkCheckRequested());

    // Listen to connectivity changes
    _connectivitySubscription?.cancel();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      add(NetworkStatusChanged(connectivityResults: results));
    });
  }

  /// To check if there is internet connection
  bool _hasInternetConnection(List<ConnectivityResult> results) {
    // Check if any of the connectivity results indicate internet access
    return results.any(
      (result) =>
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet,
    );
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
