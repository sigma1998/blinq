// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'bloc/contacts_bloc.dart';
import 'widgets/item.dart';

class ContactsView extends StatelessWidget {
  //
  const ContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc, ContactsState>(
      builder: (context, state) {
        final contacts = state.contacts?.results ?? [];

        return Column(
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
                    imageUrl: contact.image ?? '',
                    fullName: contact.fullName,
                    phoneNumber: contact.phoneNumber ?? '',
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            GestureDetector(
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
