import 'platform_app_bar.dart';
import 'platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformScaffold extends PlatformWidget<CupertinoPageScaffold, Scaffold> {
  final Widget child;
  final Color? backgroundColor;
  final PlatformAppBar? navigationBar;
  final FloatingActionButton? floatingActionButton;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;

  PlatformScaffold({
    required this.child,
    this.navigationBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  CupertinoPageScaffold createCupertinoWidget(BuildContext context) =>
      CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: navigationBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        child: Material(
          color: Colors.transparent,
          child: child,
        ),
      );

  @override
  Scaffold createMaterialWidget(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        appBar: navigationBar,
        body: child,
        floatingActionButton: floatingActionButton,
      );
}
