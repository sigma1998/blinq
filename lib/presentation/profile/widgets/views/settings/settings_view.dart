// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/domain/repositories/auth_repository.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'package:blinq/utils/custom_widgets/toggle.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/services/permission/permission_service.dart';
import 'package:blinq/app/locator.dart';
import 'bloc/settings_bloc.dart';
import 'bloc/settings_event.dart';
import 'widgets/item.dart';

class SettingsView extends StatefulWidget {
  //
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  //
  late SettingsBloc bloc;

  @override
  void initState() {
    bloc = SettingsBloc(
        profileBloc: context.read<ProfileBloc>(),
        permissionService: getIt<PermissionService>(),
        authRepository: getIt<AuthRepositoryImpl>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, GenericBlocState<bool>>(
      bloc: bloc,
      builder: (context, state) {
        return Column(
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return SettingsItem(
                  onTap: bloc.onEmailPressed,
                  title: state.profile?.email ?? 'strEmail'.tr(),
                );
              },
            ),
            const SizedBox(height: 8),
            SettingsItem(
              onTap: bloc.onPasswordPressed,
              title: 'strChangePassword'.tr(),
            ),
            const SizedBox(height: 8),
            SettingsItem(
              onTap: bloc.onLanguagePressed,
              title: 'strChangeLanguage'.tr(),
            ),
            const SizedBox(height: 8),
            SettingsItem(
              title: 'strNotification'.tr(),
              trailing: MyToggle(
                isActive: bloc.state.data ?? false,
                onChanged: (isEnabled) => bloc.add(
                  ToggleNotification(isEnabled: isEnabled),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SettingsItem(
              onTap: bloc.onDeleteAccount,
              title: 'strDeleteAccount'.tr(),
            ),
            const Expanded(child: SizedBox(height: 24)),
            MyButton.primary(
              width: 120,
              label: 'strLogout'.tr(),
              onTap: bloc.onLogoutPressed,
              isLoading: state.status == Status.loading,
              labelStyle: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SafeArea(
              top: false,
              child: SizedBox(height: 48),
            ),
          ],
        );
      },
    );
  }
}
