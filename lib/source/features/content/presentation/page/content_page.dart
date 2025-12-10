import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tecnical_task/source/core/dependencies/app_dependencies.dart';
import 'package:tecnical_task/source/core/values/constant/app_dimensions.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';
import 'package:tecnical_task/source/core/values/enums/state_app_enum.dart';
import 'package:tecnical_task/source/features/content/presentation/bloc/content_bloc.dart';
import 'package:tecnical_task/source/features/content/presentation/page/views/content_app_bar_view.dart';
import 'package:tecnical_task/source/features/content/presentation/page/views/content_card_view.dart';
import 'package:tecnical_task/source/layout/app_status/app_empty_data_layout.dart';
import 'package:tecnical_task/source/layout/app_status/app_failure_layout.dart';
import 'package:tecnical_task/source/layout/app_status/app_loading_layout.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<ContentBloc>()..add(ContentFetched()),
      child: Scaffold(
        /// AppBar
        appBar: ContentAppBarView(),

        /// Body
        body: BlocBuilder<ContentBloc, ContentState>(
          builder: (context, state) {
            switch (state.stateApp) {
              /// loading state
              case StateAppEnum.initial:
              case StateAppEnum.loading:
                return AppLoadingLayout();

              /// failure state
              case StateAppEnum.failure:
                return AppFailureLayout(
                  title: AppStrings.retry,
                  onPressed: () {
                    context.read<ContentBloc>().add(ContentFetched());
                  },
                );

              /// loaded state
              case StateAppEnum.loaded:
              case StateAppEnum.success:

                /// empty state
                if (state.items.isEmpty) {
                  return AppEmptyDataLayout(
                    title: AppStrings.noContentAvailable,
                  );
                }

                /// loaded state with pull to refresh
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<ContentBloc>().add(ContentFetched());
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(
                      AppDimensions.paddingOrMargin16,
                    ),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return ContentCardView(item: item);
                    },
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
