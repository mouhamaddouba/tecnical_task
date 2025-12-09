import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:tecnical_task/source/core/bloc/network/network_bloc.dart';
import 'package:tecnical_task/source/core/dependencies/app_dependencies.dart';

/// This to call many cubit or bloc in main
class AppBloc {
  static List<SingleChildWidget> providers = [
    /// Bloc network
    BlocProvider.value(value: instance<NetworkBloc>()),
  ];
}
