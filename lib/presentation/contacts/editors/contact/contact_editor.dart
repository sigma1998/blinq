// Flutter imports:
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/views/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/presentation/contacts/editors/widgets/action_buttons.dart';
import 'package:blinq/utils/custom_widgets/text_fields/phone_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/app/locator.dart';
import 'bloc/contact_editor_bloc.dart';
import 'bloc/contact_editor_event.dart';

class ContactEditor extends StatefulWidget {
  //
  static const String route = '/contact_editor';

  const ContactEditor({super.key});

  @override
  State<ContactEditor> createState() => _ContactEditorState();
}

class _ContactEditorState extends State<ContactEditor> {
  //
  int? id;

  late ContactEditorBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    bloc = ContactEditorBloc(
      mediaService: getIt<MediaService>(),
      contactsBloc: context.read<ContactsBloc>(),
      repository: getIt<ContactsRepositoryImpl>(),
    );

    id = ModalRoute.of(context)?.settings.arguments as int?;

    if (id != null) {
      bloc.initializeFields(id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: BlocBuilder<ContactEditorBloc, ContactEditorState>(
        bloc: bloc,
        builder: (context, state) {
          final isLoading = state.status == Status.loading;

          return SafeArea(
            child: MyInfoContainer(
              isEdit: true,
              onClose: bloc.onNavigateBack,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16).copyWith(top: 0),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 96,
                        child: MyImage(
                          bloc.imageUrl,
                          width: 86,
                          height: 86,
                          file: state.image,
                          onChangeImage: () => bloc.add(OnUpdateContactImage()),
                        ),
                      ),
                      const SizedBox(height: 16),
                      NameTextField(
                        labelText: 'strFirstName'.tr(),
                        controller: bloc.firstNameController,
                      ),
                      const SizedBox(height: 40),
                      NameTextField(
                        labelText: 'strLastName'.tr(),
                        controller: bloc.lastNameController,
                      ),
                      const SizedBox(height: 40),
                      PhoneTextField(
                        controller: bloc.phoneNumberController,
                      ),
                      const SizedBox(height: 52),
                      EditorActionButtons(
                        id: id,

                        onSave: () => id != null
                            ? bloc.add(OnUpdateContact(id: id!))
                            : bloc.add(OnAddContact()),
                        onDelete: () => bloc.add(OnDeleteContact(id: id!)),
                      ),
                    ],
                  ),
                  if(isLoading)
                    const Center(
                      child: Loading(),
                    )

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
