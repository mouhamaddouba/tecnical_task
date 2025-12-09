import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:tecnical_task/source/core/themes/app_colors_theme.dart';

void showToast(String text) => BotToast.showText(text: text);

void showSuccessToast(String text) => BotToast.showText(
  text: text,
  contentColor: AppColorsTheme.secondary.withValues(alpha: 0.7),
);

void showWarningToast(String text) => BotToast.showText(
  text: text,
  contentColor: AppColorsTheme.warning.withValues(alpha: 0.7),
  align: Alignment.topCenter,
);

void showErrorToast(String text) => BotToast.showText(
  text: text,
  contentColor: AppColorsTheme.error.withValues(alpha: 0.7),
  align: Alignment.topCenter,
);
