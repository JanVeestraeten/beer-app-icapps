import 'dart:io';
import 'package:beer_app_icapps/app.dart';
import 'package:beer_app_icapps/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> doCall<T>(
  Future<dynamic> networkCall, {
  Function(T _)? succesFunction,
  Function(dynamic error)? errorFunction,
  bool showDialogs = true,
}) async {
  T response;

  try {
    response = await networkCall;

    if (succesFunction != null) {
      await succesFunction(response);
    }

    return response;
  } catch (e) {
    if (errorFunction != null) {
      await errorFunction(e);
    }

    if (showDialogs) {
      if (e is DioError) {
        if (Platform.isIOS) {
          showAlertDialog(title: S.current.app_name, message: e.message);
        } else {
          showSnackBar(message: e.message);
        }
      } else {
        if (Platform.isIOS) {
          showAlertDialog(title: S.current.app_name, message: e.toString());
        } else {
          showSnackBar(message: e.toString());
        }
      }
    }

    // rethrow;
    // return null;
  }
}

void showSnackBar({required String? message}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
  ScaffoldMessenger.of(navigatorKey.currentContext!)
      .showSnackBar(SnackBar(content: Text(message ?? "")));
}

Future<dynamic> showAlertDialog(
    {required String? title, required String? message}) {
  bool isVisible = false;
  if (!isVisible) {
    isVisible = true;
    return showDialog(
      context: navigatorKey.currentContext!,
      builder: (_) => CupertinoAlertDialog(
        title: Text(title ?? ""),
        content: Text(message ?? ""),
        actions: [
          CupertinoButton(
              child: const Text("OK"),
              onPressed: () {
                isVisible = false;
                navigatorKey.currentState?.pop();
              })
        ],
      ),
    );
  }
}
