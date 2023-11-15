import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'bloc/premade_messages_bloc.dart';
import 'widgets/item.dart';

class PremadeMessagesView extends StatelessWidget {
  //
  const PremadeMessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PremadeMessagesBloc, PremadeMessagesState>(
      builder: (context, state) {
        final premadeMessages = state.premadeMessages?.results ?? [];

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: premadeMessages.length,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final premadeMessage = premadeMessages[index];

                  return PremadeMessageItem(
                    title: premadeMessage.title ?? '',
                    message: premadeMessage.message ?? '',
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            GestureDetector(
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
