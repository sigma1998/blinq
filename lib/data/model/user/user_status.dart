// Package imports:
import 'package:hive/hive.dart';

part 'user_status.g.dart';

@HiveType(typeId: 0)
enum UserStatus {
  @HiveField(0)
  newUser,

  @HiveField(1)
  signed,

  @HiveField(2)
  haveSeenIntro

}
