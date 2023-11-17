// Flutter imports:
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/editors/premage_message/bloc/premade_message_editor_event.dart';
import 'package:blinq/presentation/contacts/views/premade_messages/bloc/premade_messages_bloc.dart';
import 'package:blinq/presentation/contacts/editors/widgets/action_buttons.dart';
import 'package:blinq/utils/custom_widgets/text_fields/name_text_field.dart';
import 'package:blinq/domain/repositories/premade_messages_repository.dart';
import 'package:blinq/utils/custom_widgets/keyboard_escape.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'bloc/premade_message_editor_bloc.dart';
import 'package:blinq/app/locator.dart';

class PremadeMessageEditor extends StatefulWidget {
  //
  static const String route = '/premade_message_editor';

  const PremadeMessageEditor({super.key});

  @override
  State<PremadeMessageEditor> createState() => _PremadeMessageEditorState();
}

class _PremadeMessageEditorState extends State<PremadeMessageEditor> {
  //
  int? id;

  late PremadeMessageEditorBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    bloc = PremadeMessageEditorBloc(
      repository: getIt<PremadeMessagesRepositoryImpl>(),
      premadeMessagesBloc: context.read<PremadeMessagesBloc>(),
    );

    id = ModalRoute.of(context)?.settings.arguments as int?;

    if (id != null) {
      bloc.initializeFields(id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardEscape(
      child: BlocBuilder<PremadeMessageEditorBloc, PremadeMessageEditorState>(
        bloc: bloc,
        builder: (context, state) {
          final isLoading = state.status == Status.loading;

          return SafeArea(
            child: MyInfoContainer(
              isEdit: true,
              onClose: bloc.onNavigateBack,
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.1,
              margin: const EdgeInsets.all(16).copyWith(top: 0),
              child: Stack(
                children: [
                  Column(
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
                      const SizedBox(height: 52),
                      EditorActionButtons(
                        id: id,
                        onSave: () => id != null
                            ? bloc.add(OnUpdatePremadeMessage(id: id!))
                            : bloc.add(OnAddPremadeMessage()),
                        onDelete: () => bloc.add(OnDeletePremadeMessage(id: id!)),
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
