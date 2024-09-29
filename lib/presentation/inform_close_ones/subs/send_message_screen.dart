import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'package:blinq/presentation/inform_close_ones/bloc/inform_close_ones_event.dart';
import 'package:blinq/presentation/inform_close_ones/widgets/images_section.dart';
import 'package:blinq/utils/components/buttons/regular_button.dart';
import 'package:blinq/utils/components/items/message_item.dart';
import 'package:blinq/utils/services/dialogs/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/locator.dart';
import '../../../core/drawables/app_text_styles.dart';
import '../../../data/model/premade_message/response/premade_message_response_model.dart';
import '../../../utils/components/app_bar/back_app_bar.dart';
import '../../../utils/components/dialogs/bottom_sheet/user_message.dart';
import '../../../utils/services/permission/permission_service.dart';
import '../../contacts/pages/premade_messages/bloc/premade_messages_bloc.dart';
import '../../premade_message_selector_sheet/bloc/premade_message_selector_bloc.dart';
import '../../premade_message_selector_sheet/bloc/premade_message_selector_event.dart';
import '../bloc/inform_close_ones_bloc.dart';

class SendMessageScreen extends StatefulWidget {
  final VoidCallback onBackPressed;
  final List<ContactResponseModel> selectedContacts;

  const SendMessageScreen({
    super.key,
    required this.onBackPressed,
    required this.selectedContacts,
  });

  @override
  State<SendMessageScreen> createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  late PreMadeMessageSelectorBloc bloc;

  @override
  void initState() {
    bloc = PreMadeMessageSelectorBloc(
      premadeMessagesBloc: context.read<PreMadeMessagesBloc>(),
      permissionService: getIt<PermissionServiceImpl>(),
    );
    bloc.add(OnLoadPreMadeMessages());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreMadeMessageSelectorBloc, PremadeMessageSelectorState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: BackAppBar(
            title: 'Messages',
            onTap: widget.onBackPressed,
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ///top images
              ImagesSection(
                selectedContacts: widget.selectedContacts,
                onRemoveTap: (ContactResponseModel contact) {
                  if (widget.selectedContacts.length == 1) {
                    widget.onBackPressed.call();
                  }
                  context
                      .read<InformCloseOnesBloc>()
                      .add(OnSelectContact(contact: contact));
                },
              ),
              const SizedBox(height: 32),
              Text(
                'Choose and send message',
                style: AppTextStyles.s17W600.copyWith(
                  color: AppColors.grey2,
                ),
              ),
              const SizedBox(height: 8),

              ///messages
              ListView.builder(
                shrinkWrap: true,
                itemCount: state.premadeMessages.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return MessageItem(
                    message: state.premadeMessages[index],
                    selected:
                        state.selectedMessage == state.premadeMessages[index],
                    onTap: () {
                      setState(() {
                        if (state.selectedMessage ==
                            state.premadeMessages[index]) {
                          bloc.add(OnSelectPreMadeMessage(message: null));
                        } else {
                          bloc.add(
                            OnSelectPreMadeMessage(
                                message: state.premadeMessages[index]),
                          );
                        }
                      });
                    },
                  );
                },
              ),

              ///Other
              MessageItem(
                message: const PreMadeMessageResponseModel(message: 'Other'),
                selected: false,
                onTap: () async {
                  final res = await showCustomBottomSheet(
                    context: context,
                    child: const UserMessage(),
                  );
                  if (res != null) {
                    bloc.sendMessage(
                      widget.selectedContacts.map<String>((element) {
                        return element.phoneNumber ?? '';
                      }).toList(),
                      message: res,
                    );
                  }
                },
              ),
              const SizedBox(height: 200),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RegularButton(
              title: 'Send message',
              enable: state.selectedMessage != null,
              onTap: () {
                bloc.sendMessage(
                  widget.selectedContacts.map<String>((element) {
                    return element.phoneNumber ?? '';
                  }).toList(),
                  message: state.selectedMessage?.message,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
