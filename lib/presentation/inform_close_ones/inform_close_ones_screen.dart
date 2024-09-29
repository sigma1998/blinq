// Flutter imports:
import 'package:blinq/presentation/inform_close_ones/subs/inform_contacts_screen.dart';
import 'package:blinq/presentation/inform_close_ones/subs/send_message_screen.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/presentation/inform_close_ones/bloc/inform_close_ones_bloc.dart';
import '../../utils/generic_bloc_state.dart';
import 'bloc/inform_close_ones_event.dart';

class InformCloseOnesScreen extends StatefulWidget {
  //
  static const String route = '/inform_close_ones';

  const InformCloseOnesScreen({super.key});

  @override
  State<InformCloseOnesScreen> createState() => _InformCloseOnesScreenState();
}

class _InformCloseOnesScreenState extends State<InformCloseOnesScreen> {
  //
  late InformCloseOnesBloc bloc;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<InformCloseOnesBloc>(
        create: (context) => bloc,
        child: BlocBuilder<InformCloseOnesBloc, InformCloseOnesState>(
          bloc: bloc,
          builder: (context, state) {
            return PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                InformContactsScreen(
                  isLoading: state.status == Status.loading,
                  contacts: state.contacts,
                  selectedContacts: state.selectedContacts,
                  bloc: bloc,
                  onSendMessage: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                ),
                SendMessageScreen(
                  selectedContacts: state.selectedContacts,
                  onBackPressed: () {
                    controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    bloc = InformCloseOnesBloc(
      contactsBloc: context.read<ContactsBloc>(),
    );
    bloc.add(OnLoadContacts());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
