// Package imports:
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class MyUrlLauncher {
  //
  static Future<bool> open(String link) async {
    final uri = Uri.parse(link);
    final isValid = await canLaunchUrl(uri);
    if (isValid) await launchUrl(uri, mode: LaunchMode.externalApplication);
    return isValid;
  }

  static Future<bool> browse(String url) {
    return open('https://$url');
  }

  static Future<bool> call(String phone) {
    String result = '';

    if (isPhoneValid(phone)) {
      result += '+$phone';
    } else {
      result += phone;
    }

    return open('tel:$result');
  }

  static Future<bool> message(String phone) {
    return open('smsto:$phone');
  }

  static Future<bool> email(String email, [String? subject]) {
    final extra = subject != null ? '?subject=$subject' : '';
    return open('mailto:$email$extra');
  }
}
