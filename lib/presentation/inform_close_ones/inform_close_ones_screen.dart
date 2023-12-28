// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/presentation/inform_close_ones/bloc/inform_close_ones_bloc.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'bloc/inform_close_ones_event.dart';
import 'widgets/item.dart';

class InformCloseOnesScreen extends StatefulWidget {
  //
  static const String route = '/inform_close_ones';

  const InformCloseOnesScreen({super.key});

  @override
  State<InformCloseOnesScreen> createState() => _InformCloseOnesScreenState();
}

class _InformCloseOnesScreenState extends State<InformCloseOnesScreen> {
  //
  late InformCloseOnesBloc bloc;

  @override
  void initState() {
    bloc = InformCloseOnesBloc(
      contactsBloc: context.read<ContactsBloc>(),
    );
    bloc.add(OnLoadContacts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformCloseOnesBloc, InformCloseOnesState>(
      bloc: bloc,
      builder: (context, state) {
        final isLoading = state.status == Status.loading;
        final list = state.contacts;

        return Scaffold(
          extendBody: true,
          appBar: MyAppBar(
            title: 'strInformYourCloseOnes'.tr(),
          ),
          body: isLoading
              ? const Loading()
              : ListView(
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
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final contact = list[index];

                        return InformCloseOnesItem(
                          contact: contact,
                          onPhoneCall: bloc.onPhoneCall,
                          isChecked: state.selectedContacts.contains(contact),
                          onChanged: (_) =>
                              bloc.add(OnSelectContact(contact: contact)),
                        );
                      },
                    ),
                  ],
                ),
          bottomNavigationBar: isLoading
              ? null
              : MyButton.primary(
                  margin: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                  onTap: bloc.onChoosePremadeMessage,
                  label: 'strChoosethepremademessage'.tr(),
                  enable: state.selectedContacts.isNotEmpty,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
        );
      },
    );
  }
}
