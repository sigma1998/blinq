// Flutter imports:
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/custom_widgets/secondary_button.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QrDialog extends StatelessWidget {
  //
  const QrDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();

    return MyInfoContainer(
      padding: const EdgeInsets.all(36),
      height: MediaQuery.of(context).size.height * 0.42,
      margin: const EdgeInsets.symmetric(horizontal: 51),
      child: Column(
        children: [
          CachedNetworkImage(
            width: 177,
            height: 177,
            placeholder: (context, url) => const Loading(),
            imageUrl: '${profileBloc.state.profile?.qrCode}',
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: 40),
          SecondaryButton(
            label: 'strClose'.tr(),
            onTap: NavigationService.back,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
