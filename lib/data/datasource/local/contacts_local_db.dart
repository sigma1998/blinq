// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'package:blinq/data/model/contact/response/contact_response_model.dart';
import 'storage_constants.dart';

abstract class ContactsLocalStorage {
  //
  void setContacts(List<ContactResponseModel> contacts);
  List<ContactResponseModel> getContacts();
}

class ContactsLocalStorageImpl implements ContactsLocalStorage {
  //
  @override
  List<ContactResponseModel> getContacts() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.contacts);
  }

  @override
  void setContacts(List<ContactResponseModel> contacts) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.contacts, contacts);
  }
}
