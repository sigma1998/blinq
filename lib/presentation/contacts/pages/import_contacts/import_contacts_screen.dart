import 'package:blinq/core/locale/app_locale.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_bloc.dart';
import 'package:blinq/presentation/contacts/pages/contacts/bloc/contacts_event.dart';
import 'package:blinq/utils/custom_widgets/app_bar/app_bar.dart';
import 'package:blinq/utils/custom_widgets/loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/flutter_contacts.dart';


class ImportContactsScreen extends StatefulWidget {
  const ImportContactsScreen({super.key});

  @override
  State<ImportContactsScreen> createState() => _ImportContactsScreenState();
}

class _ImportContactsScreenState extends State<ImportContactsScreen> {
  List<Contact> contacts = [];
  List<Contact> chosenContacts = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getContacts();
    });
    super.initState();
  }

  getContacts() async {
    if (await FlutterContacts.requestPermission(readonly: true)) {

      FlutterContacts.config.returnUnifiedContacts = false;
      final list = await FlutterContacts.getContacts(withProperties: true);
      print('DATA____________________${list.first.phones}');
      print('DATA____________________${list}');
      setState(() {
        contacts.addAll(list);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title:AppLocale.chooseFromMyContacts.tr(),
        canPop: true,
      ),
      body: contacts.isEmpty
          ? const Loading()
          : Stack(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  itemCount: contacts.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (chosenContacts.contains(contacts[index])) {
                            chosenContacts.remove(contacts[index]);
                          } else {
                            chosenContacts.add(contacts[index]);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 26,
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: contains(index)
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: contains(index)
                                      ? Colors.transparent
                                      : AppColors.darkGrey,
                                ),
                              ),
                              child: contains(index)
                                  ? const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 14,
                                    )
                                  : const SizedBox(),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                height: 60,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 16),
                                decoration: BoxDecoration(
                                  color: contains(index)
                                      ? AppColors.primaryColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: contains(index)
                                        ? Colors.transparent
                                        : AppColors.darkGrey,
                                  ),
                                ),
                                child: Text(
                                  '${contacts[index].name.first} ${contacts[index].name.last}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: chosenContacts.isNotEmpty
                                ? AppColors.primaryColor
                                : AppColors.grey1,
                          ),
                          onPressed: () {
                            if (chosenContacts.isNotEmpty) {
                              final checkedContacts = <Contact>[];
                              for (var element in chosenContacts) {
                                if(element.phones.isNotEmpty) {
                                  if(element.phones.first.number.isNotEmpty) {
                                    checkedContacts.add(element);
                                  }
                                }
                              }
                              context
                                  .read<ContactsBloc>()
                                  .add(OnAddContactsList(checkedContacts));
                            }
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Add',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  bool contains(int index) {
    return chosenContacts.contains(contacts[index]);
  }
}
