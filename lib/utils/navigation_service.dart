// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';

// Package imports:
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Project imports:
import 'package:blinq/app.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'custom_widgets/cupertino_action/cupertino_action_sheet.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> homeInfoNavigatorKey = GlobalKey();
  static final GlobalKey<NavigatorState> contactsNavigatorKey = GlobalKey();

  static bool isActiveDialog = false;

  static Future<dynamic> push(
      {required BuildContext context, required Widget screen}) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static Future<dynamic> pushNamed({
    required String routeName,
    Object? arguments,
    GlobalKey<NavigatorState>? nestedKey,
  }) {
    Fluttertoast.cancel();
    FocusManager.instance.primaryFocus?.unfocus();
    if (nestedKey != null) {
      return nestedKey.currentState!.pushNamed(
        routeName,
        arguments: arguments,
      );
    } else {
      return navigatorKey.currentState!.pushNamed(
        routeName,
        arguments: arguments,
      );
    }
  }

  static Future<dynamic>? pushReplacement(
      {required String routeName,
      Object? arguments,
      GlobalKey<NavigatorState>? nestedKey}) async {
    if (nestedKey != null) {
      return nestedKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }
  }

  static Future<dynamic>? newRootScreen(
    String newRouteName, {
    RoutePredicate? predicate,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
    GlobalKey<NavigatorState>? nestedKey,
  }) {
    if (nestedKey != null) {
      return nestedKey.currentState!.pushNamedAndRemoveUntil(
        newRouteName,
        predicate ?? (_) => false,
        arguments: arguments,
      );
    } else {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        newRouteName,
        predicate ?? (_) => false,
        arguments: arguments,
      );
    }
  }

  static String getCurrentRouteName() {
    return navigatorKey.currentState?.widget.pages.last.name ?? '';
  }

  static void back<T extends Object?>({T? result}) {
    isActiveDialog = false;
    navigatorKey.currentState!.pop(result);
  }

  static void showSnackBar({required SnackBar snackBar}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }

  static void updateLocale(String lang) {
    MyApp.of(navigatorKey.currentContext!)!.updateLocale(lang);
  }

  static void showErrorSnackBar({required SnackBar snackBar}) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }

  static void removeSnackBar() {
    ScaffoldMessenger.of(navigatorKey.currentContext!).removeCurrentSnackBar();
  }

  static void hideSnackBar() {
    ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
  }

  static Future<dynamic>? showBottomSheet({
    required Widget sheet,
    Color? barierColor,
    bool isScrollable = true,
    bool isScrollControlled = true,
  }) async {
    return await material.showModalBottomSheet(
      context: navigatorKey.currentContext!,
      isScrollControlled: isScrollControlled,
      shape: isScrollable
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ))
          : null,
      backgroundColor: isScrollable ? AppColors.darkGrey : Colors.transparent,
      barrierColor: barierColor ?? AppColors.darkGrey.withOpacity(0.3),
      builder: (context) => sheet,
    );
  }

  static Future showMyCupertinoModalPopup({
    required List<Widget> actions,
    String? title,
  }) {
    return showCupertinoModalPopup(
      context: navigatorKey.currentContext!,
      builder: (_) => MyCupertinoActionSheet(
        title: title,
        actions: actions,
      ),
    );
  }

  static Future<dynamic>? showDialog({
    required Widget dialog,
    double? padding,
    Color barrierColor = Colors.transparent,
  }) {
    isActiveDialog = true;

    return material.showDialog(
      useSafeArea: false,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      context: navigatorKey.currentContext!,
      builder: (context) {
        return Theme(
          data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.black,
            onPrimary: Colors.white,
            secondary: AppColors.darkGrey,
            onSecondary: AppColors.grey1,
            onSecondaryContainer: AppColors.lightGrey2,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.black,
            onBackground: AppColors.darkGrey,
            surface: AppColors.darkGrey,
            onSurface: Colors.white,
            outline: AppColors.grey2,
            outlineVariant: AppColors.lightGrey,
            tertiary: AppColors.lightGreyVariant,
            secondaryContainer: AppColors.darkGreyVarient,
            surfaceVariant: AppColors.messageBackgroundColor,
            inversePrimary: AppColors.darkRedColor,
            onSurfaceVariant: AppColors.lightGrey3,
          )),
          child: Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: barrierColor,
            child: dialog,
          ),
        );
      },
    );
  }

  static void showErrorToast(String text) {
    Flushbar(
      borderRadius: BorderRadius.circular(15),
      title: 'Error',
      messageText: Text(text),
      flushbarPosition: FlushbarPosition.TOP,
      barBlur: 7.0,
      backgroundColor: AppColors.primaryColor,
      duration: const Duration(seconds: 3),
    ).show(navigatorKey.currentContext!);
  }

  static bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  static Future<void> showToast(
      {required String text, required String title}) async {
    await Flushbar(
      borderRadius: BorderRadius.circular(15),
      title: title,
      messageText: Text(text),
      flushbarPosition: FlushbarPosition.TOP,
      barBlur: 7.0,
      backgroundColor: Colors.grey.withOpacity(0.2),
      duration: const Duration(seconds: 3),
    ).show(navigatorKey.currentContext!);
  }
}
