import 'package:beer_app_icapps/generated/l10n.dart';
import 'package:flutter/services.dart';

import 'platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformSliverNavigationBar
    extends PlatformWidget<CupertinoSliverNavigationBar, SliverAppBar> {
  final Widget? leading;
  final String? title;
  final Color? backgroundColor;
  final Color? arrowColor;
  final String? previousTitle;
  final TextStyle? textStyle;
  final bool hasBackButton;
  final Brightness? brightness;
  final bool showBorder;
  final bool animate;
  final List<Widget>? actions;
  final bool roundedBorder;

  PlatformSliverNavigationBar({
    this.leading,
    this.title,
    this.backgroundColor,
    this.arrowColor,
    this.previousTitle,
    this.textStyle,
    this.hasBackButton = true,
    this.brightness,
    this.showBorder = false,
    this.animate = true,
    this.actions,
    this.roundedBorder = false,
  });

  @override
  CupertinoSliverNavigationBar createCupertinoWidget(BuildContext context) =>
      CupertinoSliverNavigationBar(
        backgroundColor: backgroundColor,
        previousPageTitle: previousTitle ?? S.of(context).back,
        brightness: brightness,
        leading: leading,
        // automaticallyImplyLeading: leading == null ? false : true,
        largeTitle: Text(
          title ?? "",
          style: textStyle,
        ),
        trailing: actions != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!,
              )
            : null,
        border: _createBorder(),
        transitionBetweenRoutes: animate,
      );

  Border? _createBorder() {
    if (roundedBorder) {
      return const Border(left: BorderSide());
    }
    if (showBorder) {
      return const Border();
    } else {
      return null;
    }
  }

  @override
  SliverAppBar createMaterialWidget(BuildContext context) {
    TextStyle _textStyle = const TextStyle(fontWeight: FontWeight.bold);
    return SliverAppBar(
      backgroundColor: backgroundColor,
      titleTextStyle: _textStyle,
      iconTheme: IconThemeData(color: arrowColor),
      leading: leading,
      elevation: showBorder ? null : 2.0,
      actions: actions,
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
      ),
      expandedHeight: 100,
      shape: roundedBorder
          ? const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
              ),
            )
          : null,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final FlexibleSpaceBarSettings settings = context
              .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
          final double deltaExtent = settings.maxExtent - settings.minExtent;
          // 0.0 -> Expanded
          // 1.0 -> Collapsed to toolbar
          final double scrollingRate = (1.0 -
                  (settings.currentExtent - settings.minExtent) / deltaExtent)
              .clamp(0.0, 1.0);
          // return builder(context, scrollingRate);
          return Padding(
            padding: EdgeInsets.only(
                bottom: (kToolbarHeight / 2) - 12,
                left: 20 + ((hasBackButton ? 40 : 0) * scrollingRate)),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title ?? "",
                  style: _textStyle.copyWith(
                      fontSize: 35 - (scrollingRate * 17.5)),
                )),
          );
        },
      ),
    );
  }
}
