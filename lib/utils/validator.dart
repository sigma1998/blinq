import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';

/*========================Email Validator==============================================*/
class Validator {
  static String? validateEmail(String? value) {
    if (value?.isEmpty??true) {
      return 'strEmailEmpty'.tr();
    } else if (!EmailValidator.validate(value!)) {
      return 'strInvalidEmail'.tr();
    }
    return null;
  }

  bool validateStrongPassword(value) {
    var pattern =
        "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$";
    RegExp regex = RegExp(pattern);
    return (regex.hasMatch(value)) ? false : true;
  }

  static String? validateConfirmPasswordMatch(
      {String? value, String? password}) {
    if (value!.isEmpty) {
      return 'strCPasswordEmpty'.tr();
    } else if (value.length < 4) {
      return 'strInvalidPassword'.tr();
    } else if (value != password) {
      return "strPasswordMatc".tr();
    }
    return null;
  }

  // static String? validatePhoneNumber(String value) {
  //   if (value.isEmpty) {
  //     return 'strPhoneEmEmpty'.tr();
  //   } else if (!GetUtils.isPhoneNumber(value.trim())) {
  //     return "strPhoneNumberInvalid".tr();
  //   }
  //   return null;
  // }

  static String? fieldChecker({required String value, required message}) {
    if (value.toString().trim().isEmpty) {
      return "$message ${'strCannotBeEmpty'.tr}";
    }
    return null;
  }
}

/*================================================== Password Validator ===================================================*/

class PasswordFormValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return "strPasswordEmpty".tr();
    } else if (value.length < 6) {
      return 'strInvalidPassword'.tr();
    }
    return null;
  }

  static String? validatePasswordMatch(
      {String? value, String? confirmPassword}) {
    if (value!.isEmpty) {
      return 'strCPasswordEmpty'.tr();
    } else if (value.length < 8) {
      return 'strInvalidPassword'.tr();
    } else if (value != confirmPassword) {
      return 'strPasswordMatc'.tr();
    }
    return null;
  }
}

/*================================================== Phone Number Validator ===================================================*/

class PhoneNumberValidate {
  static String? validateMobile(String value) {
    if (value.isEmpty) {
      return 'strPhoneEmEmpty'.tr();
    } else if (value.length < 8 || value.length > 15) {
      return 'strPhoneNumberInvalid'.tr();
    } else if (!validateNumber(value)) {
      return 'strSpecialCharacter'.tr();
    }
    return null;
  }
}

bool validateNumber(String value) {
  var pattern = r'^[0-9]+$';
  RegExp regex = RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

/*===============================Field Checker=================================================*/

class FieldChecker {
  static String? fieldChecker(String? value, message) {
    if (value == null || value.toString().trim().isEmpty) {
      return "$message ${'strCannotBeEmpty'.tr}";
    }
    return null;
  }
}
