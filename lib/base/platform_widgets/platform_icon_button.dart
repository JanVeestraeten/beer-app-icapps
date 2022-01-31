import 'platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformIconButton extends PlatformWidget<TextButton, Material> {
  final Widget icon;
  final Color backgroundColor;
  final Function() onPressed;
  final Color? splashColor;
  final double? splashRadius;

  PlatformIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
    this.splashColor,
    this.splashRadius,
  });

  @override
  TextButton createCupertinoWidget(BuildContext context) => TextButton(
        child: icon,
        onPressed: onPressed,
      );

  @override
  Material createMaterialWidget(BuildContext context) => Material(
      color: backgroundColor,
      child: IconButton(
        icon: icon,
        splashColor: splashColor,
        splashRadius: splashRadius,
        onPressed: onPressed,
      ));
}
