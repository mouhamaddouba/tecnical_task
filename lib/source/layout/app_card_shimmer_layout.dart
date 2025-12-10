import 'package:flutter/material.dart';
import 'package:tecnical_task/source/core/themes/app_colors_theme.dart';
import 'package:tecnical_task/source/core/values/constant/app_dimensions.dart';

class AppCardShimmerLayout extends StatefulWidget {
  const AppCardShimmerLayout({super.key});

  @override
  State<AppCardShimmerLayout> createState() => _AppCardShimmerLayoutState();
}

class _AppCardShimmerLayoutState extends State<AppCardShimmerLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.paddingOrMargin12),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingOrMargin16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment(_animation.value - 1, 0),
                          end: Alignment(_animation.value, 0),
                          colors: [
                            AppColorsTheme.lightGrey,
                            AppColorsTheme.grey.withValues(alpha: 0.3),
                            AppColorsTheme.lightGrey,
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: AppDimensions.paddingOrMargin12),
                Expanded(
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Container(
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: LinearGradient(
                            begin: Alignment(_animation.value - 1, 0),
                            end: Alignment(_animation.value, 0),
                            colors: [
                              AppColorsTheme.lightGrey,
                              AppColorsTheme.grey.withValues(alpha: 0.3),
                              AppColorsTheme.lightGrey,
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.paddingOrMargin12),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  height: 16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      begin: Alignment(_animation.value - 1, 0),
                      end: Alignment(_animation.value, 0),
                      colors: [
                        AppColorsTheme.lightGrey,
                        AppColorsTheme.grey.withValues(alpha: 0.3),
                        AppColorsTheme.lightGrey,
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: AppDimensions.paddingOrMargin8),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  height: 16,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      begin: Alignment(_animation.value - 1, 0),
                      end: Alignment(_animation.value, 0),
                      colors: [
                        AppColorsTheme.lightGrey,
                        AppColorsTheme.grey.withValues(alpha: 0.3),
                        AppColorsTheme.lightGrey,
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
