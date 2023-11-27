// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/connect_to_blinq/widgets/items/previously_conntected_item.dart';
import 'package:blinq/presentation/connect_to_blinq/cubit/connect_to_blinq_cubit.dart';
import 'package:blinq/utils/services/local_storage/shared_preferences.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class PreviouslyConnectedToBlinqCard extends StatefulWidget {
  //
  const PreviouslyConnectedToBlinqCard({super.key});

  @override
  State<PreviouslyConnectedToBlinqCard> createState() =>
      _PreviouslyConnectedToBlinqCardState();
}

class _PreviouslyConnectedToBlinqCardState
    extends State<PreviouslyConnectedToBlinqCard> {
  //
  List<DiscoveredDevice> _savedDevices = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getDevice();
    });
  }

  void updateState() => {if (mounted) setState(() {})};

  Future<void> getDevice() async {
    _savedDevices = await LocalStorageService().getDevices;
    updateState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ConnectToBlinqCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'strPreviouslyConnectedBLINQ'.tr(),
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
        const SizedBox(height: 16),
        MyInfoContainer(
          padding: EdgeInsets.zero,
          child: BlocBuilder<ConnectToBlinqCubit, ConnectToBlinqState>(
            builder: (context, state) {
              final list = _savedDevices;

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final device = list[index];

                  return PreviouslyConntectedToBlinqItem(
                    name: device.name,
                    hasDivider: index != list.length - 1,
                    onEdit: () async {
                      await cubit.onRenameDevice(device);
                      await getDevice();
                    },
                    onConnect: () => cubit.onConnectDevice(device),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
