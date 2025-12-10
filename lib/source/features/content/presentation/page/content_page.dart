import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnical_task/source/core/dependencies/app_dependencies.dart';
import 'package:tecnical_task/source/features/content/presentation/bloc/content_bloc.dart';
import 'package:tecnical_task/source/features/content/presentation/page/views/content_app_bar_view.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<ContentBloc>(),
      child: Scaffold(
        /// AppBar
        appBar: ContentAppBarView(),
      ),
    );
  }
}
