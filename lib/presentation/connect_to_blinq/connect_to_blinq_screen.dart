// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/widgets/states/initial_state.dart';
import 'package:blinq/utils/custom_widgets/buttons/close_button.dart';
import 'widgets/states/scanning_state.dart';
import 'bloc/connect_to_blinq_bloc.dart';
import 'widgets/states/select_state.dart';

class ConnectToBlinqScreen extends StatelessWidget {
  //
  static const route = '/connect_to_blinq';

  const ConnectToBlinqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = ConnectToBlinqBloc();

    return SafeArea(
      child: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<ConnectToBlinqBloc, ConnectToBlinqState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Stack(
                children: [
                  MyCloseButton(
                    onTap: bloc.onNavigateBack,
                  ),
                  Column(
                    children: [
                      if (state.isScanning) ...[
                        const Expanded(
                          child: ConnectToBlinqScanningStateWidget(),
                        ),
                      ] else ...[
                        const ConnectToBlinqSelectStateWidget(),
                      ],
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
