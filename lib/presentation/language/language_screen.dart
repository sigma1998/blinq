// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/app/locator.dart';
import 'package:blinq/domain/repositories/profile_repository.dart';
import 'package:blinq/presentation/language/bloc/language_event.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'bloc/language_bloc.dart';
import 'widgets/item.dart';

class LanguageScreen extends StatefulWidget {
  //
  static const route = '/language';

  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  //
  late final LanguageBloc bloc;

  @override
  void initState() {
    bloc = LanguageBloc(repository: getIt<ProfileRepositoryImpl>());
    final res =
        NavigationService.navigatorKey.currentContext!.locale.languageCode;
    if (res == 'en') {
      bloc.add(Init(lang: ProfileLanguage.en));
    } else {
      bloc.add(Init(lang: ProfileLanguage.hu));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'strChooseLanguage'.tr()),
      body: BlocBuilder<LanguageBloc, LanguageState>(
        bloc: bloc,
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsets.only(top: 32),
            itemCount: ProfileLanguage.values.length,
            itemBuilder: (context, index) {
              final language = ProfileLanguage.values[index];

              return LanguageItem(
                title: language.name,
                isSelected: state.lang == language,
                isLoading: state.status == Status.loading,
                onSelect: () => bloc.add(OnLanguageChanged(lang: language)),
              );
            },
          );
        },
      ),
    );
  }
}
