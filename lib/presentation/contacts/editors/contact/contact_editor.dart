// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/views/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/utils/custom_widgets/text_fields/phone_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/app/locator.dart';
import 'bloc/contact_editor_bloc.dart';

class ContactEditor extends StatelessWidget {
  //
  const ContactEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = ContactEditorBloc(
      contactsBloc: context.read<ContactsBloc>(),
      mediaService: getIt<MediaService>(),
      repository: getIt<ContactsRepositoryImpl>(),
    );

    return BlocBuilder<ContactEditorBloc, ContactEditorState>(
      bloc: bloc,
      builder: (context, state) {
        return MyInfoContainer(
          isEdit: true,
          onClose: () {},
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16).copyWith(top: 0),
          child: Column(
            children: [
              SizedBox(
                width: 96,
                child: MyImage(
                  '',
                  width: 86,
                  height: 86,
                  onChangeImage: bloc.imagePickerPressed,
                ),
              ),
              const SizedBox(height: 16),
              NameTextField(
                labelText: 'strFirstName'.tr(),
                controller: TextEditingController(),
              ),
              const SizedBox(height: 40),
              NameTextField(
                labelText: 'strLastName'.tr(),
                controller: TextEditingController(),
              ),
              const SizedBox(height: 40),
              PhoneTextField(
                controller: TextEditingController(),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyButton.tertiary(
                    label: 'strDelete'.tr(),
                    onTap: () {},
                    labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 52,
                    ),
                  ),
                  const SizedBox(width: 12),
                  MyButton.primary(
                    label: 'strSave'.tr(),
                    onTap: () {},
                    labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 52,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
