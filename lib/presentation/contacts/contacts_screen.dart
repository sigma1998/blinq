// Flutter imports:
import 'package:blinq/presentation/contacts/views/contacts/bloc/contacts_event.dart';
import 'package:blinq/presentation/contacts/views/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/presentation/contacts/views/premade_messages/bloc/premade_messages_event.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/tab_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/contacts/bloc/contacts_bloc.dart';
import 'views/contacts/contacts_view.dart';
import 'views/premade_messages/premade_messages_view.dart';

class ContactsScreen extends StatefulWidget {
  //
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
    context.read<PremadeMessagesBloc>().add(OnFetchPremadeMessages());

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
              'strMyContacts'.tr(),
              'strPreMadeSms'.tr(),
            ],
            tabController: _tabController,
            margin: const EdgeInsets.symmetric(horizontal: 72),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ContactsView(),
                PremadeMessagesView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
