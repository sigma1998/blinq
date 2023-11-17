// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:blinq/presentation/contacts/contacts_screen.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/app/routes.dart';

class Contacts extends StatelessWidget {
  //
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: ContactsScreen.route,
      onGenerateRoute: onGenerateContactRoutes,
      key: NavigationService.contactsNavigatorKey,
    );
  }
}
