// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'bloc/contacts_bloc.dart';
import 'widgets/item.dart';

class ContactsPage extends StatelessWidget {
  //
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ContactsBloc>();

    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        final isLoading = state.status == Status.loading;
        final contacts = state.contacts?.results ?? [];

        return isLoading
            ? const Loading()
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: contacts.length,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final contact = contacts[index];

                        return ContactItem(
                          contact: contact,
                          onMessage: bloc.onMessage,
                          onPhoneCall: bloc.onPhoneCall,
                          onEdit: (id) => bloc.onEditPressed(id: id),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () => bloc.onEditPressed(),
                    child: SvgPicture.asset(
                      AppDrawables.plus,
                      width: 54,
                      height: 54,
                    ),
                  ),
                  const SafeArea(
                    top: false,
                    child: SizedBox(height: 16),
                  ),
                ],
              );
      },
    );
  }
}
