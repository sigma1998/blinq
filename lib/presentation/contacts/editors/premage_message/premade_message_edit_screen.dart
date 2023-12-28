// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/presentation/contacts/editors/premage_message/bloc/premade_message_edit_event.dart';
import 'package:blinq/presentation/contacts/editors/widgets/card.dart';
import 'package:blinq/presentation/contacts/pages/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'bloc/premade_message_edit_bloc.dart';

class PremadeMessageEditScreen extends StatefulWidget {
  //
  static const String route = '/pre_made_message_edit_screen';

  const PremadeMessageEditScreen({super.key});

  @override
  State<PremadeMessageEditScreen> createState() =>
      _PremadeMessageEditScreenState();
}

class _PremadeMessageEditScreenState extends State<PremadeMessageEditScreen> {
  //
  int? id;

  late PremadeMessageEditorBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    bloc = PremadeMessageEditorBloc(
      repository: getIt<PremadeMessagesRepositoryImpl>(),
      preMadeMessagesBloc: context.read<PreMadeMessagesBloc>(),
    );

    id = ModalRoute.of(context)?.settings.arguments as int?;

    if (id != null) {
      bloc.initializeFields(id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: BlocBuilder<PremadeMessageEditorBloc, PreMadeMessageEditorState>(
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
                        ? bloc.add(OnAddPreMadeMessage())
                        : bloc.add(OnUpdatePreMadeMessage(id: id!));
                  }
                },
                onDelete: () => bloc.add(OnDeletePreMadeMessage(id: id!)),
                children: [
                  NameTextField(
                    labelText: 'strMessageName'.tr(),
                    controller: bloc.titleController,
                  ),
                  const SizedBox(height: 40),
                  NameTextField(
                    labelText: 'strMessages'.tr(),
                    controller: bloc.messageController,
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
