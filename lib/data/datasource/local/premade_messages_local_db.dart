// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'package:blinq/data/model/premade_message/response/premade_message_response_model.dart';
import 'storage_constants.dart';

abstract class PremadeMessagesLocalStorage {
  //
  void setPremadeMessages(List<PremadeMessageResponseModel> messages);
  List<PremadeMessageResponseModel> getPremadeMessages();
}

class PremadeMessagesLocalStorageImpl implements PremadeMessagesLocalStorage {
  //
  @override
  List<PremadeMessageResponseModel> getPremadeMessages() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.premadeMessages);
  }

  @override
  void setPremadeMessages(List<PremadeMessageResponseModel> messages) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.premadeMessages, messages);
  }
}
