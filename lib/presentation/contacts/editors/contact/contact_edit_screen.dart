// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/contacts_repository.dart';
import 'package:blinq/presentation/contacts/editors/widgets/card.dart';
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/custom_widgets/text_fields/phone_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/services/media/media_service.dart';
import 'bloc/contact_edit_bloc.dart';
import 'bloc/contact_edit_event.dart';

class ContactEditScreen extends StatefulWidget {
  //
  static const String route = '/contact_edit_screen';

  const ContactEditScreen({super.key});

  @override
  State<ContactEditScreen> createState() => _ContactEditScreenState();
}

class _ContactEditScreenState extends State<ContactEditScreen> {
  //
  int? id;

  late ContactEditBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    bloc = ContactEditBloc(
      mediaService: getIt<MediaServiceImpl>(),
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
      child: BlocBuilder<ContactEditBloc, ContactEditState>(
        bloc: bloc,
        builder: (context, state) {
          final isLoading = state.status == Status.loading;

          return Scaffold(
            body: Form(
              key: bloc.formKey,
              child: EditCard(
                isLoading: isLoading,
                onNavigateBack: bloc.onNavigateBack,
                id: id,
                onSave: () {
                  if (bloc.validateForm()) {
                    id == null
                        ? bloc.add(OnAddContact())
                        : bloc.add(OnUpdateContact(id: id!));
                  }
                },
                onDelete: () => bloc.add(OnDeleteContact(id: id!)),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
