// Dart imports:
import 'dart:io';

// Package imports:
import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

// Project imports:
import 'package:blinq/data/model/driver_license/driver_license_dto.dart';
import 'package:blinq/utils/date_formatter.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';

import '../../../second_driver_editors/screens/driver/driver_screen.dart';

part 'scan_driver_license_state.dart';
part 'scan_driver_license_cubit.freezed.dart';

List<CameraDescription> cameras = [];

class ScanDriverLicenseCubit extends Cubit<ScanDriverLicenseState> {
  //
  late CameraController controller;

  ScanDriverLicenseCubit() : super(const ScanDriverLicenseState());

  void initializeCamera() async {
    emit(state.copyWith(controllerIsInitialized: false));
    cameras = await availableCameras();
    controller = CameraController(
      cameras[0],
      enableAudio: false,
      ResolutionPreset.max,
    );
    controller.initialize().then(
          (value) => {
            emit(state.copyWith(controllerIsInitialized: true)),
          },
        );
  }

  Future<void> onScanPressed() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final inputImage = await controller.takePicture();
      final textDetector = TextRecognizer();

      RecognizedText recognisedText = await textDetector
          .processImage(InputImage.fromFilePath(inputImage.path));

      await textDetector.close();

      _parseData(recognisedText, inputImage);
      emit(state.copyWith(status: Status.success));
      onSkipPressed();
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  void onSkipPressed() {
    NavigationService.pushReplacement(
      routeName: SecondDriverEditorScreen.route,
      nestedKey: NavigationService.homeNavigatorKey,
    );
  }

  /// [_parseData] parses the data from the [RecognizedText] object
  /// and saves it to the [DriverLicenseDto] object
  void _parseData(RecognizedText recognisedText, XFile inputImage) {
    //
    String firstName = '';
    String lastName = '';
    DateTime? dateOfBirth;
    DateTime? issueDate;
    DateTime? expirationDate;
    String licenseNumber = '';
    String licenseType = '';

    RegExp fieldPattern = RegExp(r'^(\d+|[4-9a-c()]+)\.\s*(.+)$');
    RegExp licenseTypePattern = RegExp(r'[^a-zA-Z0-9]');

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        String lineText = line.text.trim();

        Match? match = fieldPattern.firstMatch(lineText);

        if (match != null) {
          String fieldNumber = match.group(1)!;
          String fieldValue = match.group(2)!;

          switch (fieldNumber) {
            case '1':
              // Extract last name
              lastName = fieldValue;
              break;
            case '2':
              // Extract first name
              firstName = fieldValue;
              break;
            case '3':
              // Extract date of birth
              dateOfBirth = DateFormatter.parseDateString(fieldValue);
              break;
            case '4a':
            case '4(a)':
              // Extract issue date
              issueDate = DateFormatter.parseDateString(fieldValue);
              break;
            case '4b':
            case '4(b)':
              // Extract expiration date
              expirationDate = DateFormatter.parseDateString(fieldValue);
              break;
            case '5':
              // Extract license_model number
              licenseNumber = fieldValue.replaceAll('.', '');
              break;
            case '9':
              // Extract license_model type
              licenseType =
                  fieldValue.replaceAll(licenseTypePattern, '').substring(0, 2);
              break;
          }
        }
      }
    }

    final model = DriverLicenseDto(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      issueDate: issueDate,
      expirationDate: expirationDate,
      licenseNumber: licenseNumber,
      licenseType: licenseType,
    );

    // print('DriverLicenseDto: ${model.toJson()}');

    emit(state.copyWith(
      driverLicenseDto: model,
      file: File(inputImage.path),
    ));
  }

  Future<void> disposeController() {
    return controller.dispose();
  }
}
