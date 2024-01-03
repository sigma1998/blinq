// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:blinq/core/network/api_service.dart';
import 'package:blinq/core/network/network_constants.dart';
import 'package:blinq/data/datasource/remote/profile_api.dart';
import 'package:blinq/data/model/car/response/car_response_model.dart';
import 'package:blinq/data/model/insurance/response/insurance_response_model.dart';
import 'package:blinq/data/model/policy_holder/response/policy_holder_response_model.dart';
import 'package:blinq/data/model/profile/driver_license/driver_license_type.dart';
import 'package:blinq/data/model/profile/request/profile_request_model.dart';
import 'package:blinq/data/model/profile/response/profile_response_model.dart';
import 'package:blinq/data/model/vehicle/response/vehicle_response_model.dart';
import 'profile_api_test.mocks.dart';

@GenerateMocks([AppApi])
void main() {
  late MockAppApi mockApiService;
  late ProfileApiImpl profileApiImpl;

  const profileRequestModel = ProfileRequestModel(
    firstName: 'test',
    lastName: 'test',
    birthDate: 'test',
    country: 'test',
    address: 'test',
    phoneNumber: 'test',
    postalCode: 'test',
    driverLicenseNumber: 'test',
    driverLicenseExpiredDate: 'test',
    driverLicense: DriverLicenseType.a,
  );

  const carResponseModel = CarResponseModel();
  const policyHolderResponseModel = PolicyHolderResponseModel();
  const insuranceResponseModel = InsuranceResponseModel();
  const userVehicle = UserVehicleResponseModel();

  const profileResponseModel = ProfileResponseModel(
    id: 0,
    image: '',
    firstName: 'test',
    lastName: 'test',
    birthDate: '',
    country: '',
    address: '',
    phoneNumber: '',
    email: '',
    qrCode: '',
    driverLicense: DriverLicenseType.a,
    driverLicenseNumber: '',
    driverLicenseExpiredDate: '',
  );

  setUp(() {
    mockApiService = MockAppApi();
    profileApiImpl = ProfileApiImpl(api: mockApiService);
  });

  group('Profile', () {
    test('fetch', () async {
      // Arrange
      when(mockApiService.get(
        NetworkConstants.profileData,
      )).thenAnswer((_) async => profileResponseModel.toJson());

      // Act
      await profileApiImpl.fetch();

      // Assert
      verify(mockApiService.get(NetworkConstants.profileData));
    });

    // @override
    // Future<ProfileResponseModel> update(ProfileRequestModel profile) {
    //   try {
    //     return api
    //         .patch(NetworkConstants.profile, data: profile.toJson())
    //         .then((data) {
    //       return ProfileResponseModel.fromJson(data);
    //     });
    //   } catch (e) {
    //     rethrow;
    //   }
    // }

    // @override
    // Future<void> updateProfileImage(File file) async {
    //   try {
    //     final image = await MultipartFile.fromFile(file.path,
    //         filename: file.path.split('/').last);
    //     var formData = FormData.fromMap({'image': image});
    //     return api.patch(NetworkConstants.profile, data: formData);
    //   } catch (e) {
    //     rethrow;
    //   }
    // }
  });
}
