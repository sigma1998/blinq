// Package imports:
import 'package:hive/hive.dart';

// Project imports:
import 'package:blinq/data/model/premade_message/premade_message_response_dto.dart';
import 'storage_constants.dart';

abstract class PremadeMessagesLocalStorage {
  //
  void setPremadeMessages(PremadeMessageResponseDto messages);
  PremadeMessageResponseDto getPremadeMessages();
}

class PremadeMessagesLocalStorageImpl implements PremadeMessagesLocalStorage {
  //
  @override
  PremadeMessageResponseDto getPremadeMessages() {
    final box = Hive.box(StorageConstants.appBox);
    return box.get(StorageConstants.premadeMessages);
  }

  @override
  void setPremadeMessages(PremadeMessageResponseDto messages) {
    final box = Hive.box(StorageConstants.appBox);
    box.put(StorageConstants.premadeMessages, messages);
  }
}
