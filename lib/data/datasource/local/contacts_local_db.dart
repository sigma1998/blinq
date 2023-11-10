// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'package:blinq/data/model/contact/contact_response_dto.dart';
import 'storage_constants.dart';

abstract class ContactsLocalStorage {
  //
  void setContacts(ContactResponseDto contacts);
  ContactResponseDto getContacts();
}

class ContactsLocalStorageImpl implements ContactsLocalStorage {
  //
  @override
  ContactResponseDto getContacts() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.contacts);
  }

  @override
  void setContacts(ContactResponseDto contacts) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.contacts, contacts);
  }
}
