import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_service.g.dart';

class ThemeService extends _ThemeService with _$ThemeService {}

abstract class _ThemeService with Store {
  @observable
  ThemeMode themeMode = ThemeMode.dark;

  @action
  void changeTheme({required ThemeMode mode}) {
    themeMode = mode;
  }
}
