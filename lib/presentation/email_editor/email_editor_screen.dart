// Flutter imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/utils/custom_widgets/expanded_section.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/text_fields/base_text_field.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/email_editor/bloc/email_editor_bloc.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/email_editor_event.dart';

class EmailEditorScreen extends StatelessWidget {
  //
  static const route = '/email_editor';

  const EmailEditorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = EmailEditorBloc(repository: getIt<ProfileRepositoryImpl>());

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
                    labelText: 'strYourCurrentEmail'.tr(),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) =>
                        bloc..add(OnCurrentEmailChanged(value)),
                  ),
                  const SizedBox(height: 48),
                  BaseTextField(
                    labelText: 'strYourNewEmail'.tr(),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => bloc..add(OnNewEmailChanged(value)),
                  ),
                  ExpandedSection(
                    expand: state.isCodeSent,
                    child: Column(
                      children: [
                        const SizedBox(height: 6),
                        BaseTextField(
                          hintText: 'strEnterCode'.tr(),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) =>
                              bloc..add(OnConfrimationCodeChanged(value)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  AppButton(
                    onTap: () {
                      if (state.isCodeSent) {
                        bloc.add(OnVerifyEmail());
                      } else {
                        bloc.add(OnSendCode());
                      }
                    },
                    text: state.isCodeSent
                        ? 'strConfirm'.tr()
                        : 'strSendCode'.tr(),
                    btnColor: Colors.white,
                    txtColor: Colors.black,
                    loading: state.status == Status.loading,
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
