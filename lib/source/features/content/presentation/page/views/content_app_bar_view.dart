import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tecnical_task/source/core/routes/app_routes.dart';
import 'package:tecnical_task/source/core/values/constant/app_strings.dart';
import 'package:tecnical_task/source/features/content/presentation/bloc/content_bloc.dart';

class ContentAppBarView extends StatelessWidget implements PreferredSizeWidget {
  const ContentAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(AppStrings.contentTitle),

      /// Button logout
      actions: [
        BlocListener<ContentBloc, ContentState>(
          listenWhen: (previous, current) =>
              previous.navigateToLogin != current.navigateToLogin,
          listener: (context, state) {
            if (state.navigateToLogin) {
              context.go(AppRoutes.login);
            }
          },
          child: IconButton(
            icon: const Icon(Icons.logout),
            tooltip: AppStrings.logout,
            onPressed: () {
              showDialog(
                context: context,
                builder: (dialogContext) {
                  return AlertDialog(
                    key: key,
                    constraints: BoxConstraints(
                      maxWidth: double.infinity,
                      minWidth: double.infinity,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),

                    /// Icon close with title
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// text title dialog
                        const Text(
                          AppStrings.logout,
                          style: TextStyle(fontSize: 18),
                        ),

                        /// Icon close
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.only(bottom: 24, left: 24),

                    /// Content
                    content: const Text(
                      AppStrings.sureLogout,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    /// Action button confirm and cancel
                    actions: [
                      /// Button confirm
                      ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(AppStrings.confirm),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          context.read<ContentBloc>().add(LogoutEvent());
                        },
                      ),

                      /// Button cancel
                      OutlinedButton(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(AppStrings.cancel),
                        ),
                        onPressed: () => Navigator.of(context).pop(false),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
