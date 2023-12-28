import 'package:blinq/app/locator.dart';
import 'package:blinq/data/model/notification/request_notification.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/presentation/notification_dialog/notification_dilaog_bloc.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/custom_widgets/default_image.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationDialog extends StatefulWidget {
  final RequestNotificationDto requestNotificationDto;

  const NotificationDialog({super.key, required this.requestNotificationDto});

  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  late NotificationDialogBloc bloc;

  @override
  void initState() {
    bloc = NotificationDialogBloc(
        accidentRepository: getIt<AccidentRepositoryImpl>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationDialogBloc, GenericBlocState<bool>>(
        bloc: bloc,
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme
                    .of(context)
                    .colorScheme
                    .secondary),
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 61, right: 31, left: 31, bottom: 36),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MyImage(
                        widget.requestNotificationDto.image,
                        width: 110,
                        height: 110,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.requestNotificationDto.fullName,
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(widget.requestNotificationDto.car,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${widget.requestNotificationDto
                            .fullName} ${'strWantsToConnect'.tr()}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'strDoYouConfirm'.tr(),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AppButton(
                          onTap: () {
                            bloc.sendAnswer(
                                true, widget.requestNotificationDto.accidentId);
                          },
                          text: 'strYes'.tr()),
                      const SizedBox(
                        height: 10,
                      ),
                      AppButton(
                        onTap: () {
                          bloc.sendAnswer(
                              false, widget.requestNotificationDto.accidentId);
                        },
                        text: 'strNo'.tr(),
                        btnColor: Theme
                            .of(context)
                            .colorScheme
                            .onSecondary,
                      ),
                    ],
                  ),
                ),
                if (state.status == Status.loading)
                  const Positioned(
                      top: 24, right: 24, child: CupertinoActivityIndicator())
              ],
            ),
          );
        });
  }
}
