// Flutter imports:
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/profile/bloc/profile_bloc.dart';
import 'bloc/language_bloc.dart';
import 'widgets/items/item.dart';

class LanguageScreen extends StatelessWidget {
  //
  static const route = '/language';

  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = LanguageBloc(profileBloc: context.read<ProfileBloc>());

    return Scaffold(
      appBar: MyAppBar(title: 'strChooseLanguage'.tr()),
      body: ListView.builder(
        itemCount: ProfileLanguage.values.length,
        itemBuilder: (context, index) {
          final language = ProfileLanguage.values[index];

          return LanguageItem(
            onSelect: () {},
            title: language.name,
          );
        },
      ),
    );
  }
}
