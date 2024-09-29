// Flutter imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/app_bar/progress_app_bar.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hand_signature/signature.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/custom_widgets/step_indicator.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
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
      user: user,
      reportBloc: context.read(),
      accidentRepository: getIt<AccidentRepositoryImpl>(),
      breakdownRepository: getIt<BreakdownRepositoryImpl>(),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignScreenBloc, GenericBlocState>(
      bloc: bloc,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: const ProgressAppBar(step: 12),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    '12. ${'strPleaseSign'.tr() + bloc.driver}',
                    style: AppTextStyles.s22W600,
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.darkGrey,
                ),
                Expanded(
                  child: RepaintBoundary(
                    key: bloc.previewContainer,
                    child: Container(
                      width: double.maxFinite,
                      child: HandSignature(
                        control: bloc.control,
                        color: Theme.of(context).colorScheme.primary,
                        width: 3,
                        type: SignatureDrawType.line,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.darkGrey,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => bloc.control.clear(),
                      icon: SvgPicture.asset(
                        AppDrawables.delete,
                        colorFilter: const ColorFilter.mode(
                          AppColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                NavigationButton(
                  padding: 16,
                  loading: state.status == Status.loading,
                  onNextTap: () => bloc.onNextTap(context),
                ),
                const SizedBox(height: 20),
              ],
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
