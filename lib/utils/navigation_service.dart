import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:fluttertoast/fluttertoast.dart';



class NavigationService {
  static final  GlobalKey<NavigatorState>  navigatorKey = GlobalKey();

  static bool isActiveDialog = false;

  static Future<dynamic> pushNamed({required String routeName,
    Object? arguments,
    GlobalKey<NavigatorState>? nestedKey}) {
    Fluttertoast.cancel();
    FocusManager.instance.primaryFocus?.unfocus();
    if (nestedKey != null) {
      return nestedKey.currentState!.pushNamed(routeName, arguments: arguments);
    }

    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? pushReplacement(
      {required String routeName, Object? arguments}) async {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? newRootScreen(String newRouteName, {
    RoutePredicate? predicate,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      newRouteName,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }

  static void back<T extends Object?>({T? result}) {
    isActiveDialog = false;
    navigatorKey.currentState!.pop(result);
  }

  static void showSnackBar({required SnackBar snackBar}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }

  static void removeSnackBar() {
    ScaffoldMessenger.of(navigatorKey.currentContext!).removeCurrentSnackBar();
  }

  static void hideSnackBar() {
    ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
  }

  static Future<dynamic>? showBottomSheet({required Widget sheet,
    Color? barierColor,
    bool isScrollControlled = true}) async {
    return await material.showModalBottomSheet(
        context: navigatorKey.currentContext!,
        isScrollControlled: isScrollControlled,
        backgroundColor: Colors.transparent,
        barrierColor: barierColor,
        builder: (context) {
          return sheet;
        });
  }

  static Future<dynamic>? showDialog({required Widget dialog,
    double? padding,
    Color barrierColor = Colors.black45}) {
    isActiveDialog = true;

    return material.showDialog(
        useSafeArea: false,
        context: navigatorKey.currentContext!,
        barrierDismissible: false,
        barrierColor: barrierColor,
        builder: (context) {
          return Dialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: barrierColor,
              child: dialog);
        });
  }

  static void showErrorToast(String text) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 18.0,
    );
  }

  static bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  static void showToast(String text) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 18.0,
    );
  }
}
