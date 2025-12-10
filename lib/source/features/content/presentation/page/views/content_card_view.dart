import 'package:flutter/material.dart';
import 'package:tecnical_task/source/core/themes/app_colors_theme.dart';
import 'package:tecnical_task/source/core/themes/app_fonts_theme.dart';
import 'package:tecnical_task/source/core/values/constant/app_dimensions.dart';
import 'package:tecnical_task/source/features/content/data/models/content_item_model.dart';

class ContentCardView extends StatelessWidget {
  final ContentItemModel item;

  const ContentCardView({super.key, required this.item});

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
                CircleAvatar(
                  backgroundColor: AppColorsTheme.primary,
                  radius: 20,
                  child: Text(
                    '${item.id}',
                    style: getMediumStyle(
                      fontSize: AppDimensions.fontSize14,
                      color: AppColorsTheme.white,
                    ),
                  ),
                ),
                const SizedBox(width: AppDimensions.paddingOrMargin12),
                Expanded(
                  child: Text(
                    item.title,
                    style: getSemiBoldStyle(
                      fontSize: AppDimensions.fontSize16,
                      color: AppColorsTheme.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.paddingOrMargin12),
            Text(
              item.body,
              style: getRegularStyle(
                fontSize: AppDimensions.fontSize14,
                color: AppColorsTheme.textSecondary,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
