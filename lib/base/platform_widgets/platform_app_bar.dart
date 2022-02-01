import 'package:beer_app_icapps/generated/l10n.dart';
import 'package:flutter/services.dart';

import 'platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformAppBar extends PlatformWidget<CupertinoNavigationBar, AppBar>
    with ObstructingPreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final String? previousPageTitle;
  final Color? backgroundColor;
  final bool showBorder;
  final IconThemeData? iconTheme;
  final Brightness? brightness;

  PlatformAppBar(
      {this.leading,
      this.title,
      this.actions,
      this.previousPageTitle,
      this.backgroundColor,
      this.showBorder = false,
      this.iconTheme,
      this.brightness});

  @override
  CupertinoNavigationBar createCupertinoWidget(BuildContext context) =>
      CupertinoNavigationBar(
        border: showBorder ? const Border(bottom: BorderSide(width: 1)) : null,
        backgroundColor: backgroundColor,
        previousPageTitle: previousPageTitle ?? S.of(context).back,
        middle: title,
        padding: iconTheme == null
            ? null
            : const EdgeInsetsDirectional.only(start: 0),
        trailing: actions != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!,
              )
            : null,
        brightness: brightness,
      );

  @override
  AppBar createMaterialWidget(BuildContext context) => AppBar(
        iconTheme: iconTheme,
        elevation: showBorder ? 2.0 : 0.0,
        backgroundColor: backgroundColor,
        leading: leading,
        title: title,
        actions: actions,
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   statusBarBrightness: brightness,
        //   statusBarIconBrightness: brightness,
        //   systemNavigationBarIconBrightness: brightness,
        // ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) => false;
}
