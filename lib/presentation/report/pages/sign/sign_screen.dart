import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/utils/custom_widgets/app_btn.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/step_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hand_signature/signature.dart';

import 'sing_screen_bloc.dart';

class SignScreen extends StatefulWidget {
  static const String route = '/sign_screen';

  const SignScreen({Key? key}) : super(key: key);

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  late SignScreenBloc bloc;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments as SignScreenArgs?;

    final User user = args?.user ?? User.A;

    bloc = SignScreenBloc(
        accidentRepository: getIt<AccidentRepositoryImpl>(),
        reportBloc: context.read(),
        user: user);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignScreenBloc, GenericBlocState>(
      bloc: bloc,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StepIndicator(currentStep: bloc.user == User.A ? 16: 17),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'strPleaseSign'.tr() + bloc.driver,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                  RepaintBoundary(
                    key: bloc.previewContainer,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.secondary),
                      height: 200,
                      width: double.maxFinite,
                      child: HandSignature(
                        control: bloc.control,
                        color: Theme.of(context).colorScheme.primary,
                        width: 1,
                        type: SignatureDrawType.line,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: AppButton(
                      height: 30,
                      width: 120,
                      onTap: () => bloc.control.clear(),
                      text: 'strClear'.tr(),
                    ),
                  ),
                  const Spacer(),
                  NavigationButton(
                    loading: state.status == Status.loading,
                    onNextTap: () => bloc.onNextTap(context),
                    padding: 0,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SignScreenArgs {
  final User user;

  SignScreenArgs({required this.user});
}
