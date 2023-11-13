// Flutter imports:
import 'package:blinq/presentation/inform_close_ones/bloc/inform_close_ones_bloc.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:blinq/presentation/contacts/views/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/item.dart';

class InformCloseOnesScreen extends StatelessWidget {
  //
  static const String route = '/inform_close_ones';

  const InformCloseOnesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = InformCloseOnesBloc();

    return Scaffold(
      extendBody: true,
      appBar: MyAppBar(
        title: 'strInformYourCloseOnes'.tr(),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 18,
        ).copyWith(bottom: 18),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            'strSelectContactsThem'.tr(),
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          BlocBuilder<ContactsBloc, ContactsState>(
            builder: (context, state) {
              final list = state.contacts?.results ?? [];

              return ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final contact = list[index];

                  return InformCloseOnesItem(
                    isChecked: false,
                    onChanged: (value) {},
                    fullName: contact.fullName,
                    imageUrl: contact.image ?? '',
                    phoneNumber: contact.phoneNumber ?? '',
                  );
                },
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 18,
        ),
        child: MyButton.primary(
          isLoading: false,
          onTap: bloc.onChoosePremadeMessage,
          label: 'strChoosethepremademessage'.tr(),
        ),
      ),
    );
  }
}
