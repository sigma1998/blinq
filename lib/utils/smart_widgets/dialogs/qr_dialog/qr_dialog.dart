// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/info_container.dart';
import 'package:blinq/utils/navigation_service.dart';

class QrDialog extends StatelessWidget {
  //
  const QrDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();

    bool qrVisible = (profileBloc.checkAccountResponse?.account == true) &&
        (profileBloc.checkAccountResponse?.car == true) &&
        (profileBloc.checkAccountResponse?.insurance == true) &&
        (profileBloc.checkAccountResponse?.policyHolder == true);

    return MyInfoContainer(
      padding: const EdgeInsets.all(36),
      height: MediaQuery.of(context).size.height * (qrVisible ? 0.426 : 0.22),
      margin: const EdgeInsets.symmetric(horizontal: 51),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          qrVisible
              ? CachedNetworkImage(
                  width: 177,
                  height: 177,
                  placeholder: (context, url) => getPlaceholder(),
                  imageUrl: '${profileBloc.state.profile?.qrCode}',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Text('strPleaseFillProfileData'.tr()),
          const SizedBox(height: 40),
          MyButton.secondary(
            label: 'strClose'.tr(),
            onTap: NavigationService.back,
            labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget getPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      direction: ShimmerDirection.ltr,
      child: Container(
        color: Colors.grey[300],
      ),
    );
  }
}
