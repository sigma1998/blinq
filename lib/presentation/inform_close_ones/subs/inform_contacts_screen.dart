import 'package:blinq/presentation/inform_close_ones/widgets/emergency_section.dart';
import 'package:blinq/presentation/inform_close_ones/widgets/item.dart';
import 'package:blinq/presentation/inform_close_ones/widgets/select_all.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/contact/response/contact_response_model.dart';
import '../../../utils/components/app_bar/back_app_bar.dart';
import '../../../utils/components/buttons/regular_button.dart';
import '../../../utils/custom_widgets/loading.dart';
import '../bloc/inform_close_ones_bloc.dart';
import '../bloc/inform_close_ones_event.dart';

class InformContactsScreen extends StatefulWidget {
  final InformCloseOnesBloc bloc;
  final VoidCallback onSendMessage;
  final bool isLoading;
  final List<ContactResponseModel> contacts;
  final List<ContactResponseModel> selectedContacts;

  const InformContactsScreen({
    super.key,
    required this.bloc,
    required this.onSendMessage,
    required this.isLoading,
    required this.contacts,
    required this.selectedContacts,
  });

  @override
  State<InformContactsScreen> createState() => _InformContactsScreenState();
}

class _InformContactsScreenState extends State<InformContactsScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<InformCloseOnesBloc>();
    return Scaffold(
      extendBody: true,
      appBar: BackAppBar(title: 'strInformYourCloseOnes'.tr()),
      body: widget.isLoading
          ? const Loading()
          : ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 16),
                const EmergencySection(),
                const SizedBox(height: 32),

                ///select all
                SelectAll(
                  selectedAll:
                      widget.selectedContacts.length == widget.contacts.length,
                  selectAll: (bool all) {
                    bloc.add(
                      AllContactsSelected(all),
                    );
                  },
                ),
                const SizedBox(height: 10),

                ///contacts
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.contacts.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final contact = widget.contacts[index];

                    return InformCloseOnesItem(
                      showPhone: widget.selectedContacts.length < 2,
                      contact: contact,
                      onPhoneCall: bloc.onPhoneCall,
                      isChecked: widget.selectedContacts.contains(contact),
                      onChanged: (_) =>
                          bloc.add(OnSelectContact(contact: contact)),
                      onSmsSend: () {
                        if (widget.selectedContacts.isNotEmpty) {
                          widget.onSendMessage();
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 200),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: RegularButton(
          title: 'Send message',
          onTap: widget.onSendMessage,
          enable: widget.selectedContacts.isNotEmpty,
        ),
      ),
    );
  }
}
