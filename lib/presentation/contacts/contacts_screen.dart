// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/tab_bar.dart';
import 'pages/contacts/bloc/contacts_bloc.dart';
import 'pages/contacts/bloc/contacts_event.dart';
import 'pages/contacts/contacts_page.dart';
import 'pages/premade_messages/bloc/premade_messages_bloc.dart';
import 'pages/premade_messages/bloc/premade_messages_event.dart';
import 'pages/premade_messages/premade_messages_page.dart';

class ContactsScreen extends StatefulWidget {
  //
  static const String route = '/contacts_screen';

  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen>
    with SingleTickerProviderStateMixin {
  //
  late TabController _tabController;

  @override
  void initState() {
    context.read<ContactsBloc>().add(OnFetchContacts());
    context.read<PreMadeMessagesBloc>().add(OnFetchPreMadeMessages());

    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          MyTabBar(
            tabLabels: [
              '  ${'strMyContacts'.tr()}  ',
              '  ${'strPreMadeSms'.tr()}  ',
            ],
            tabController: _tabController,
            margin: const EdgeInsets.symmetric(horizontal: 40),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ContactsPage(),
                PreMadeMessagesPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
