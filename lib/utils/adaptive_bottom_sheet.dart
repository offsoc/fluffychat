import 'package:flutter/material.dart';

import 'package:fluffychat/config/app_config.dart';
import 'package:fluffychat/config/themes.dart';

Future<T?> showAdaptiveBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  bool isDismissible = true,
  bool isScrollControlled = true,
  double maxHeight = 600,
  bool useRootNavigator = true,
}) {
  final dialogMode = FluffyThemes.isColumnMode(context);
  return showModalBottomSheet(
    context: context,
    builder: (context) => Padding(
      padding:
          dialogMode ? const EdgeInsets.only(bottom: 32.0) : EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: dialogMode
            ? BorderRadius.circular(AppConfig.borderRadius)
            : const BorderRadius.only(
                topLeft: Radius.circular(AppConfig.borderRadius),
                topRight: Radius.circular(AppConfig.borderRadius),
              ),
        child: builder(context),
      ),
    ),
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    constraints: BoxConstraints(
      maxHeight: maxHeight + (dialogMode ? 32 : 0),
      maxWidth: FluffyThemes.columnWidth * 1.25 + 64,
    ),
    backgroundColor: Colors.transparent,
    showDragHandle: !dialogMode,
    clipBehavior: Clip.hardEdge,
  );
}
