// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/presentation/contacts/pages/widgets/empty_state.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'bloc/premade_messages_bloc.dart';
import 'widgets/item.dart';

class PreMadeMessagesPage extends StatelessWidget {
  //
  const PreMadeMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PreMadeMessagesBloc>();

    return BlocBuilder<PreMadeMessagesBloc, PreMadeMessagesState>(
      builder: (context, state) {
        final isLoading = state.status == Status.loading;
        final premadeMessages = state.premadeMessages?.results ?? [];

        return isLoading
            ? const Loading()
            : Column(
                children: [
                  if (premadeMessages.isEmpty)
                    Expanded(
                      child: ContactsEmptyStateWidget(
                        onTap: bloc.onEditPressed,
                        title: 'strNoMessageAdded'.tr(),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: premadeMessages.length,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) {
                          final premadeMessage = premadeMessages[index];

                          return PremadeMessageItem(
                            premadeMessage: premadeMessage,
                            onEdit: (id) => bloc.onEditPressed(id: id),
                          );
                        },
                      ),
                    ),
                  const SizedBox(height: 4),
                  if (premadeMessages.isNotEmpty)
                    GestureDetector(
                      onTap: () => bloc.onEditPressed(),
                      child: SvgPicture.asset(
                        AppDrawables.plus,
                        width: 54,
                        height: 54,
                      ),
                    ),
                  const SafeArea(
                    top: false,
                    child: SizedBox(height: 16),
                  ),
                ],
              );
      },
    );
  }
}
