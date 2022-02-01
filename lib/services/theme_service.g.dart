// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeService on _ThemeService, Store {
  final _$themeModeAtom = Atom(name: '_ThemeService.themeMode');

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  final _$_ThemeServiceActionController =
      ActionController(name: '_ThemeService');

  @override
  void changeTheme({required ThemeMode mode}) {
    final _$actionInfo = _$_ThemeServiceActionController.startAction(
        name: '_ThemeService.changeTheme');
    try {
      return super.changeTheme(mode: mode);
    } finally {
      _$_ThemeServiceActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode}
    ''';
  }
}
