// Dart imports:
import 'dart:convert';
import 'dart:core';
import 'dart:math';

// Package imports:
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:sprintf/sprintf.dart';

class Md5Helper {
  //
  static String generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  static String toMD5_32(String plainText) {
    var content = const Utf8Encoder().convert(plainText);
    var digest = md5.convert(content);
    List<int> md5Bytes = digest.bytes;
    String hexValue = "";
    for (int i = 0; i < md5Bytes.length; i++) {
      int val = md5Bytes[i] & 0xff;
      if (val < 16) {
        hexValue += "0";
      }
      hexValue += val.toRadixString(16);
    }
    plainText = hexValue.toString();
    return plainText;
  }

  static String toMD5_16(String plainText) {
    String str = toMD5_32(plainText);
    return str.substring(8, 24);
  }

  static String getRandomMD5_4() {
    Random random = Random();
    var code = 0;
    code = random.nextInt(9000) + 1000;
    String str = toMD5_32("$code");
    return str.substring(8, 12);
  }

  static List<int> getMD5Bytes(String plainText) {
    String md5 = toMD5_32(plainText);
    List<int> md5Bytes = List<int>.filled(16, 0);
    for (int i = 0; i < 16; i++) {
      md5Bytes[i] = int.parse(md5.substring(i * 2, i * 2 + 2), radix: 16);
    }
    return md5Bytes;
  }

  static String testMAD5() {
    //List<int> appUUID = [0x64,0x62,0x39,0x33,0x32,0x38,0x65,0x37,0x30,0x37,0x32,0x36,0x39,0x62,0x31,0x37];
    String appUUIDS = "286261f490795ef4";
    String key = "u3s3NLM4";
    //List<int> appData = [0x63,0x6F,0x74,0x73];
    String appDataS = "5be9"; //new String(appData);

    String md5 = toMD5_32(appDataS + key + appUUIDS);
    List<int> md5Bytes = List<int>.filled(16, 0);
    for (int i = 0; i < 16; i++) {
      md5Bytes[i] = int.parse(md5.substring(i * 2, i * 2 + 2), radix: 16);
    }

    String rev = "";
    for (int i = 0; i < md5Bytes.length; i++) {
      rev += sprintf("%02x ", [md5Bytes[i]]);
    }

    return rev;
  }
}
