import 'package:blinq/core/network/api_service.dart';

import '../../../data/model/driver_license/driver_license_model/license_model.dart';

class DrivingLicenceTypeDb {
  late AppApi api;
  List<LicenseModel>? _values;

  DrivingLicenceTypeDb(this.api);

  load({int next = 1}) async {
    try {
      final res = await api.get(
        '/v1/api/driver_license/',
        queryParameters: {'page': next},
      );
      List<LicenseModel>? list = await res['results'].map<LicenseModel>((e) {
        return LicenseModel.fromJson(e);
      }).toList();
      _values = [];
      _values?.addAll(list ?? []);
    } catch (e) {
      print('Error ____ DrivingLicenceTypeDb ____$e');
    }
  }

  Future<List<LicenseModel>> values() async {
    if (_values != null) {
      return _values ?? [];
    } else {
      await load();
      return _values ?? [];
    }
  }
}
