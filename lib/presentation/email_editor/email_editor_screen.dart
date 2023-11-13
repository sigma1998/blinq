// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/text_fields/base_text_field.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/email_editor/bloc/email_editor_bloc.dart';
import 'package:blinq/app/locator.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/expanded_section.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/email_editor_event.dart';

class EmailEditorScreen extends StatefulWidget {
  //
  static const route = '/email_editor';

  const EmailEditorScreen({super.key});

  @override
  State<EmailEditorScreen> createState() => _EmailEditorScreenState();
}

class _EmailEditorScreenState extends State<EmailEditorScreen> {
  //
  late final profileBloc = context.read<ProfileBloc>();

  late EmailEditorBloc bloc;

  @override
  void initState() {
    bloc = EmailEditorBloc(
      profileBloc: profileBloc,
      repository: getIt<ProfileRepositoryImpl>(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: Scaffold(
        appBar: MyAppBar(title: 'strEmail'.tr()),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: BlocBuilder<EmailEditorBloc, EmailEditorState>(
            bloc: bloc,
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(height: 48),
                  BaseTextField(
                    enabled: false,
                    labelText: 'strYourCurrentEmail'.tr(),
                    keyboardType: TextInputType.emailAddress,
                    initialValue: profileBloc.state.profile?.email,
                  ),
                  const SizedBox(height: 48),
                  BaseTextField(
                    labelText: 'strYourNewEmail'.tr(),
                    controller: bloc.newEmailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  ExpandedSection(
                    expand: state.isCodeSent,
                    child: Column(
                      children: [
                        const SizedBox(height: 6),
                        BaseTextField(
                          hintText: 'strEnterCode'.tr(),
                          controller: bloc.codeController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  MyButton.secondary(
                    onTap: () {
                      if (state.isCodeSent) {
                        bloc.add(OnVerifyEmail());
                      } else {
                        bloc.add(OnSendCode());
                      }
                    },
                    label: state.isCodeSent
                        ? 'strConfirm'.tr()
                        : 'strSendCode'.tr(),
                    isLoading: state.status == Status.loading,
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
