// ignore_for_file: use_build_context_synchronously

// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/data/model/car/vehicle_type/vehicle_type.dart';
import 'package:blinq/domain/bloc/report_bloc/report_bloc.dart';
import 'package:blinq/domain/bloc/report_bloc/report_type.dart';
import 'package:blinq/domain/repositories/accident_repository.dart';
import 'package:blinq/domain/repositories/breakdown_repository.dart';
import 'package:blinq/presentation/report/pages/damaged_media/damaged_media_screen.dart';
import 'package:blinq/utils/generic_bloc_state.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:blinq/utils/screenshot_util.dart';
import 'damaged_parts_state.dart';

part 'vehicle_info.dart';

class DamagedPartsBloc extends Cubit<DamagedPartsState> {
  final AccidentRepository accidentRepository;
  final BreakdownRepository breakdownRepository;
  final ReportBloc reportBloc;

  final VehicleType vehicleType;

  List<String> vehiclePartList = [];

  List<String> vehicleSelect = [];

  List<String> blankVehicle = [];

  List<File?> screenShots = [];

  DamagedPartsBloc(
      {required this.vehicleType,
      required this.accidentRepository,
      required this.breakdownRepository,
      required this.reportBloc})
      : super(const DamagedPartsState()) {
    switch (vehicleType) {
      case VehicleType.moto:
        vehiclePartList = _motoPartList;
        vehicleSelect = _motoSelect;
        blankVehicle = _motoSelect;
        break;
      case VehicleType.van:
        vehiclePartList = _vanPartList;
        vehicleSelect = _vanSelect;
        blankVehicle = _blankVanSelect;
        break;
      case VehicleType.auto:
        vehiclePartList = _carPartList;
        vehicleSelect = _carsSelect;
        blankVehicle = _blankCarsSelect;
        break;
    }

    for (var _ in vehicleSelect) {
      screenShots.add(null);
    }
  }

  getList() {
    switch (vehicleType) {
      case VehicleType.auto:
        return state.carParts;
      case VehicleType.van:
        return state.bigCarParts;
      case VehicleType.moto:
        return state.motorcycleParts;
    }
  }

  Set<String> damagedParts = {};

  GlobalKey imagePreview = GlobalKey();

  var isClicked = false;
  late Timer _timer;

  void setPageIndex({
    required int index,
    required double width,
    required context,
    required ScrollController pageController,
  }) async {
    if (isClicked == false) {
      _startTimer();
      isClicked = true;
      var file = await captureSocialPng(imagePreview, context);
      screenShots[state.pageIndex] = file;

      pageController.animateTo((width - 48) * index,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);

      emit(state.copyWith(pageIndex: index));
    }
  }

  _startTimer() => _timer = Timer(const Duration(milliseconds: 500), () {
        isClicked = false;
        _timer.cancel();
      });


  void onNextTap(BuildContext context) async {
    emit(state.copyWith(status: Status.loading));

    try {
      MultipartFile? front;
      MultipartFile? left;
      MultipartFile? right;
      MultipartFile? top;
      MultipartFile? back;

      var file = await captureSocialPng(imagePreview, context);
      screenShots[state.pageIndex] = file;

      front = await _getMultiPartFile(0);

      left = await _getMultiPartFile(1);

      if (vehicleType != VehicleType.moto) {
        right = await _getMultiPartFile(2);

        top = await _getMultiPartFile(3);

        back = await _getMultiPartFile(4);
      }

      await _sendData(
          top: top, front: front, left: left, right: right, back: back);

      emit(state.copyWith(status: Status.initial));

      NavigationService.pushNamed(
          routeName: DamagedMediaScreen.route,
          nestedKey: NavigationService.homeNavigatorKey);
    } catch (e) {
      emit(state.copyWith(status: Status.initial));
    }
  }

  int getStep() {
    if (reportBloc.reportType == ReportType.accident) {
      if (reportBloc.state.user == User.A) {
        return 7;
      }
      return 12;
    } else {
      return 8;
    }
  }

  Color onFColor({
    required Offset position,
    required Color active,
    required Color inActive,
    required int index,
    required ScrollController listController,
  }) {
    Color? color;
    if (vehicleType == VehicleType.auto) {
      switch (index) {
        case 0:
          color = _onFColorFrontViewCar(position, active, inActive);

        case 1:
          color = _onFColorLeftViewCar(position, active, inActive);
        case 2:
          color = _onFColorRightViewCar(position, active, inActive);
        case 3:
          color = _onFColorTopViewCar(position, active, inActive);

        case 4:
          color = _onFColorBackViewCar(position, active, inActive);
      }
    } else if (vehicleType == VehicleType.van) {
      switch (index) {
        case 0:
          color = _onFColorFrontViewVan(position, active, inActive);

        case 1:
          color = _onFColorLeftViewVan(position, active, inActive);
        case 2:
          color = _onFColorRightViewVan(position, active, inActive);
        case 3:
          color = _onFColorTopViewVan(position, active, inActive);

        case 4:
          color = _onFColorBackViewVan(position, active, inActive);
      }
    } else if (vehicleType == VehicleType.moto) {
      switch (index) {
        case 0:
          color = _onFColorFrontViewMoto(position, active, inActive);
        case 1:
          color = _onFColorLeftViewMoto(position, active, inActive);
      }
    }

    if (color != null) {
      listController.animateTo(
        listController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    }

    return color ?? active;
  }

  Future<MultipartFile> _getMultiPartFile(int index) async {
    if (screenShots[index] == null) {
      screenShots[index] = await getImageFileFromAssets(blankVehicle[index]);
    }

    return MultipartFile.fromBytes(
      screenShots[index]!.readAsBytesSync(),
      filename: screenShots[index]?.path.split('/').last,
    );
  }

  Future<void> _sendData(
      {required MultipartFile? top,
      required MultipartFile? front,
      required MultipartFile? back,
      required MultipartFile? left,
      required MultipartFile? right}) async {
    if (reportBloc.reportType == ReportType.accident) {
      if (reportBloc.state.user == User.A) {
        await accidentRepository.damagedPoints(
            top: top,
            front: front,
            back: back,
            left: left,
            right: right,
            accidentId: reportBloc.reportId,
            damageParts: state.carParts.toList());
      } else {
        await accidentRepository.damagedPointsB(
            top: top,
            front: front,
            back: back,
            left: left,
            right: right,
            accidentId: reportBloc.reportId,
            damageParts: state.carParts.toList());
      }
    } else {
      await breakdownRepository.damagedPoints(
        top: top,
        front: front,
        back: back,
        left: left,
        right: right,
        breakdownId: reportBloc.reportId,
        damageParts: state.carParts.toList(),
      );
    }
  }

  removePart(String part) {
    Set<String> mewDamagedParts = Set.from(damagedParts);
    mewDamagedParts.remove(part);
    emit(state.copyWith(carParts: mewDamagedParts));
  }

  void selectPartFunc(String indexPart) {
    Set<String> selectedPart = {...state.carParts};
    if (!state.carParts.contains(indexPart)) {
      selectedPart.add(indexPart);
      debugPrint("If: $selectedPart");
    } else {
      for (var i = 0; i < selectedPart.length; i++) {
        if (selectedPart.toList()[i] == indexPart) {
          selectedPart.remove(indexPart);
        }
      }
      debugPrint("Else: $selectedPart");
    }
    damagedParts = selectedPart;
    emit(state.copyWith(carParts: selectedPart));
  }

  ///getActiveColorForCar for cars
  Color _onFColorTopViewCar(Offset position, Color active, Color inActive) {
    Color? color;
    final double y = double.parse(position.dy.toStringAsFixed(2));

    if (y > 11.54 && y < 73.21) {
      color = damagedParts.contains(vehiclePartList[0]) ? inActive : active;
      selectPartFunc(vehiclePartList[0]);
    } else if (y > 80.21 && y < 133.88) {
      color = damagedParts.contains(vehiclePartList[1]) ? inActive : active;
      selectPartFunc(vehiclePartList[1]);
    } else if (y > 142.21 && y < 249.21) {
      color = damagedParts.contains(vehiclePartList[2]) ? inActive : active;
      selectPartFunc(vehiclePartList[2]);
    } else if (y > 260.21 && y < 308.88) {
      color = damagedParts.contains(vehiclePartList[3]) ? inActive : active;
      selectPartFunc(vehiclePartList[3]);
    } else if (y > 318.84 && y < 333.51) {
      color = damagedParts.contains(vehiclePartList[4]) ? inActive : active;
      selectPartFunc(vehiclePartList[4]);
    }
    return color ?? active;
  }

  Color _onFColorFrontViewCar(Offset position, Color active, Color inActive) {
    Color? color;
    final double y = double.parse(position.dy.toStringAsFixed(2));
    final double x = double.parse(position.dx.toStringAsFixed(2));

    if (y > 17.96 && y < 90.96 && x > 36 && x < 251) {
      color = damagedParts.contains(vehiclePartList[0]) ? inActive : active;
      selectPartFunc(vehiclePartList[0]);
    } else if (x > 9.0 && x < 24.67 && y < 72.3) {
      color = damagedParts.contains(vehiclePartList[8]) ? inActive : active;
      selectPartFunc(vehiclePartList[8]);
    } else if (x > 265.33 && x < 284.0 && y < 72.3) {
      color = damagedParts.contains(vehiclePartList[9]) ? inActive : active;
      selectPartFunc(vehiclePartList[9]);
    } else if (x > 30.33 && x < 55.67 && y > 76.28 && y < 85.61) {
      color = damagedParts.contains(vehiclePartList[10]) ? inActive : active;
      selectPartFunc(vehiclePartList[10]);
    } else if (x > 186.33 && x < 211.33 && y > 76.95 && y < 85.95) {
      color = damagedParts.contains(vehiclePartList[11]) ? inActive : active;
      selectPartFunc(vehiclePartList[11]);
    }
    // else if (x > 68.33 && x < 172.67 && y > 88.3 && y < 108.97) {
    //   color = damagedParts.contains(vehiclePartList[12]) ? inActive : active;
    //   selectPartFunc(vehiclePartList[12]);
    // }

    else if (x > 22.67 &&
        double.parse(position.dx.toStringAsFixed(2)) < 264.33 &&
        y > 89.97 &&
        y < 138.97) {
      color = damagedParts.contains(vehiclePartList[13]) ? inActive : active;
      selectPartFunc(vehiclePartList[13]);
    }
    return color ?? active;
  }

  Color _onFColorBackViewCar(Offset position, Color active, Color inActive) {
    Color? color;
    final double y = double.parse(position.dy.toStringAsFixed(2));
    final double x = double.parse(position.dx.toStringAsFixed(2));

    if (y > 22.43 && y < 43.77) {
      color = damagedParts.contains(vehiclePartList[3]) ? inActive : active;
      selectPartFunc(vehiclePartList[3]);
    } else if (x > 30.5 && x < 80.67 && y > 70.0 && y < 80.0) {
      color = damagedParts.contains(vehiclePartList[5]) ? inActive : active;
      selectPartFunc(vehiclePartList[5]);
    } else if (x > 199.0 && x < 283.67 && y > 70.0 && y < 80.0) {
      color = damagedParts.contains(vehiclePartList[6]) ? inActive : active;
      selectPartFunc(vehiclePartList[6]);
    } else if (y > 87.1 && y < 170.77 && x > 19.67 && x < 271.0) {
      color = damagedParts.contains(vehiclePartList[7]) ? inActive : active;
      selectPartFunc(vehiclePartList[7]);
    }
    return color ?? active;
  }

  Color _onFColorLeftViewCar(Offset position, Color active, Color inActive) {
    Color? color;
    final double y = double.parse(position.dy.toStringAsFixed(2));
    final double x = double.parse(position.dx.toStringAsFixed(2));

    if (y > 11.75 && y < 30.42 && x < 172.33) {
      color = damagedParts.contains(vehiclePartList[22]) ? inActive : active;
      selectPartFunc(vehiclePartList[22]);
    } else if (y > 10.75 && y < 28.75 && x > 176.33 && x < 229.67) {
      color = damagedParts.contains(vehiclePartList[23]) ? inActive : active;
      selectPartFunc(vehiclePartList[23]);
    } else if (y > 35.75 && y < 77.09 && x > 88.67 && x < 146.33) {
      color = damagedParts.contains(vehiclePartList[24]) ? inActive : active;
      selectPartFunc(vehiclePartList[24]);
    } else if (y > 35 && y < 75 && x > 154 && x < 210) {
      color = damagedParts.contains(vehiclePartList[25]) ? inActive : active;
      selectPartFunc(vehiclePartList[25]);
    } else if (y > 39.42 && y < 50.75 && x > 37.33 && x < 96.0) {
      color = damagedParts.contains(vehiclePartList[26]) ? inActive : active;
      selectPartFunc(vehiclePartList[26]);
    } else if (y > 22.09 && y < 55.09 && x > 221.33 && x < 297.33) {
      color = damagedParts.contains(vehiclePartList[27]) ? inActive : active;
      selectPartFunc(vehiclePartList[27]);
    } else if (y > 62.75 && y < 90.75 && x > 44.67 && x < 67.0) {
      color = damagedParts.contains(vehiclePartList[28]) ? inActive : active;
      selectPartFunc(vehiclePartList[28]);
    } else if (y > 62.75 && y < 90.75 && x > 213.0 && x < 239.33) {
      color = damagedParts.contains(vehiclePartList[29]) ? inActive : active;
      selectPartFunc(vehiclePartList[29]);
    }
    return color ?? active;
  }

  Color _onFColorRightViewCar(Offset position, Color active, Color inActive) {
    Color? color;

    final double y = double.parse(position.dy.toStringAsFixed(2));
    final double x = double.parse(position.dx.toStringAsFixed(2));

    if (y > 13.07 && y < 31 && x > 84 && x < 128.33) {
      color = damagedParts.contains(vehiclePartList[14]) ? inActive : active;
      selectPartFunc(vehiclePartList[14]);
    } else if (y > 13.07 && y < 31 && x > 149.0 && x < 216.33) {
      color = damagedParts.contains(vehiclePartList[15]) ? inActive : active;
      selectPartFunc(vehiclePartList[15]);
    } else if (y > 36.74 && y < 76.07 && x > 140 && x < 201.67) {
      color = damagedParts.contains(vehiclePartList[16]) ? inActive : active;
      selectPartFunc(vehiclePartList[16]);
    } else if (y > 34.4 && y < 77.07 && x > 70.67 && x < 131.67) {
      color = damagedParts.contains(vehiclePartList[17]) ? inActive : active;
      selectPartFunc(vehiclePartList[17]);
    } else if (y > 20.4 && y < 51.07 && x > 10.67 && x < 70.67) {
      color = damagedParts.contains(vehiclePartList[18]) ? inActive : active;
      selectPartFunc(vehiclePartList[18]);
    } else if (y > 33.17 && y < 55.51 && x > 199.33 && x < 249.67) {
      color = damagedParts.contains(vehiclePartList[19]) ? inActive : active;
      selectPartFunc(vehiclePartList[19]);
    } else if (y > 58.0 && y < 79.51 && x > 214.0 && x < 240.33) {
      color = damagedParts.contains(vehiclePartList[20]) ? inActive : active;
      selectPartFunc(vehiclePartList[20]);
    } else if (y > 57.51 && y < 79.84 && x > 51.0 && x < 75.0) {
      color = damagedParts.contains(vehiclePartList[21]) ? inActive : active;
      selectPartFunc(vehiclePartList[21]);
    }
    return color ?? active;
  }

  ///getActiveColorForCar for VAN
  Color _onFColorTopViewVan(Offset position, Color active, Color inActive) {
    Color? color;

    final x = double.parse(position.dx.toStringAsFixed(2));
    final y = double.parse(position.dy.toStringAsFixed(2));

    if (x > 38 && x < 132 && y > 123 && y < 370) {
      color = damagedParts.contains(vehiclePartList[1]) ? inActive : active;
      selectPartFunc(vehiclePartList[1]);
    } else if (x > 34 && x < 138 && y > 48 && y < 118) {
      color = damagedParts.contains(vehiclePartList[0]) ? inActive : active;
      selectPartFunc(vehiclePartList[0]);
    } else if (x > 46 && x < 126 && y > 15 && y < 40) {
      color = damagedParts.contains(vehiclePartList[23]) ? inActive : active;
      selectPartFunc(vehiclePartList[23]);
    }

    return color ?? active;
  }

  Color _onFColorFrontViewVan(Offset position, Color active, Color inActive) {
    Color? color;
    final x = double.parse(position.dx.toStringAsFixed(2));
    final y = double.parse(position.dy.toStringAsFixed(2));

    if (x > 26 && x < 269 && y > 212 && y < 263) {
      color = damagedParts.contains(vehiclePartList[11]) ? inActive : active;
      selectPartFunc(vehiclePartList[11]);
    } else if (y > 200 && y < 238 && x > 79 && x < 217) {
      color = damagedParts.contains(vehiclePartList[10]) ? inActive : active;
      selectPartFunc(vehiclePartList[10]);
    } else if (x > 38 && x < 80 && y > 162 && y < 180) {
      color = damagedParts.contains(vehiclePartList[8]) ? inActive : active;
      selectPartFunc(vehiclePartList[8]);
    } else if (x > 216 && x < 256 && y > 162 && y < 180) {
      color = damagedParts.contains(vehiclePartList[9]) ? inActive : active;
      selectPartFunc(vehiclePartList[9]);
    } else if (x > 3 && x < 30 && y > 111 && y < 141) {
      color = damagedParts.contains(vehiclePartList[6]) ? inActive : active;
      selectPartFunc(vehiclePartList[6]);
    } else if (x > 265 && x < 291 && y > 111 && y < 141) {
      color = damagedParts.contains(vehiclePartList[7]) ? inActive : active;
      selectPartFunc(vehiclePartList[7]);
    }

    return color ?? active;
  }

  Color _onFColorBackViewVan(Offset position, Color active, Color inActive) {
    Color? color;
    final x = double.parse(position.dx.toStringAsFixed(2));
    final y = double.parse(position.dy.toStringAsFixed(2));

    if (x > 65 && x < 231 && y > 61 && y < 115) {
      color = damagedParts.contains(vehiclePartList[2]) ? inActive : active;
      selectPartFunc(vehiclePartList[2]);
    } else if (x > 55 && x < 144 && y > 135 && y < 237) {
      color = damagedParts.contains(vehiclePartList[29]) ? inActive : active;
      selectPartFunc(vehiclePartList[29]);
    } else if (x > 151 && x < 241 && y > 135 && y < 237) {
      color = damagedParts.contains(vehiclePartList[36]) ? inActive : active;
      selectPartFunc(vehiclePartList[36]);
    } else if (x > 40 && x < 50 && y > 88 && y < 185) {
      color = damagedParts.contains(vehiclePartList[3]) ? inActive : active;
      selectPartFunc(vehiclePartList[3]);
    } else if (x > 247 && x < 257 && y > 88 && y < 185) {
      color = damagedParts.contains(vehiclePartList[4]) ? inActive : active;
      selectPartFunc(vehiclePartList[4]);
    } else if (x > 34 && x < 261 && y > 244 && y < 258) {
      color = damagedParts.contains(vehiclePartList[5]) ? inActive : active;
      selectPartFunc(vehiclePartList[5]);
    }

    return color ?? active;
  }

  Color _onFColorLeftViewVan(Offset position, Color active, Color inActive) {
    Color? color;

    final x = double.parse(position.dx.toStringAsFixed(2));
    final y = double.parse(position.dy.toStringAsFixed(2));

    if (x > 220 && x < 238 && y > 100 && y < 117) {
      color = damagedParts.contains(vehiclePartList[35]) ? inActive : active;
      selectPartFunc(vehiclePartList[35]);
    } else if (x > 212 && x < 246 && y > 82 && y < 124) {
      color = damagedParts.contains(vehiclePartList[28]) ? inActive : active;
      selectPartFunc(vehiclePartList[28]);
    } else if (x > 46 && x < 64 && y > 100 && y < 117) {
      color = damagedParts.contains(vehiclePartList[33]) ? inActive : active;
      selectPartFunc(vehiclePartList[33]);
    } else if (x > 37 && x < 71 && y > 82 && y < 124) {
      color = damagedParts.contains(vehiclePartList[27]) ? inActive : active;
      selectPartFunc(vehiclePartList[27]);
    } else if (x > 26 && x < 60 && y > 71 && y < 85) {
      color = damagedParts.contains(vehiclePartList[25]) ? inActive : active;
      selectPartFunc(vehiclePartList[25]);
    } else if (x > 65 && x < 119 && y > 69 && y < 107) {
      color = damagedParts.contains(vehiclePartList[22]) ? inActive : active;
      selectPartFunc(vehiclePartList[22]);
    } else if (x > 120 && x < 184 && y > 64 && y < 106) {
      color = damagedParts.contains(vehiclePartList[24]) ? inActive : active;
      selectPartFunc(vehiclePartList[24]);
    } else if (x > 190 && x < 263 && y > 64 && y < 106) {
      color = damagedParts.contains(vehiclePartList[26]) ? inActive : active;
      selectPartFunc(vehiclePartList[26]);
    } else if (x > 47 && x < 120 && y > 24 && y < 60) {
      color = damagedParts.contains(vehiclePartList[20]) ? inActive : active;
      selectPartFunc(vehiclePartList[20]);
    } else if (x > 125 && x < 185 && y > 24 && y < 60) {
      color = damagedParts.contains(vehiclePartList[30]) ? inActive : active;
      selectPartFunc(vehiclePartList[30]);
    } else if (x > 194 && x < 267 && y > 24 && y < 51) {
      color = damagedParts.contains(vehiclePartList[21]) ? inActive : active;
      selectPartFunc(vehiclePartList[21]);
    }

    return color ?? active;
  }

  Color _onFColorRightViewVan(Offset position, Color active, Color inActive) {
    Color? color;

    final x = double.parse(position.dx.toStringAsFixed(2));
    final y = double.parse(position.dy.toStringAsFixed(2));

    if (x > 220 && x < 238 && y > 100 && y < 117) {
      color = damagedParts.contains(vehiclePartList[32]) ? inActive : active;
      selectPartFunc(vehiclePartList[32]);
    } else if (x > 212 && x < 246 && y > 82 && y < 124) {
      color = damagedParts.contains(vehiclePartList[18]) ? inActive : active;
      selectPartFunc(vehiclePartList[18]);
    } else if (x > 46 && x < 64 && y > 100 && y < 117) {
      color = damagedParts.contains(vehiclePartList[34]) ? inActive : active;
      selectPartFunc(vehiclePartList[34]);
    } else if (x > 37 && x < 71 && y > 82 && y < 124) {
      color = damagedParts.contains(vehiclePartList[19]) ? inActive : active;
      selectPartFunc(vehiclePartList[19]);
    } else if (x > 222 && x < 257 && y > 71 && y < 85) {
      color = damagedParts.contains(vehiclePartList[17]) ? inActive : active;
      selectPartFunc(vehiclePartList[17]);
    } else if (x > 166 && x < 212 && y > 69 && y < 107) {
      color = damagedParts.contains(vehiclePartList[14]) ? inActive : active;
      selectPartFunc(vehiclePartList[14]);
    } else if (x > 102 && x < 157 && y > 64 && y < 107) {
      color = damagedParts.contains(vehiclePartList[15]) ? inActive : active;
      selectPartFunc(vehiclePartList[15]);
    } else if (x > 18 && x < 92 && y > 64 && y < 106) {
      color = damagedParts.contains(vehiclePartList[16]) ? inActive : active;
      selectPartFunc(vehiclePartList[16]);
    } else if (x > 19 && x < 92 && y > 24 && y < 60) {
      color = damagedParts.contains(vehiclePartList[12]) ? inActive : active;
      selectPartFunc(vehiclePartList[12]);
    } else if (x > 98 && x < 158 && y > 24 && y < 60) {
      color = damagedParts.contains(vehiclePartList[31]) ? inActive : active;
      selectPartFunc(vehiclePartList[31]);
    } else if (x > 168 && x < 235 && y > 24 && y < 65) {
      color = damagedParts.contains(vehiclePartList[13]) ? inActive : active;
      selectPartFunc(vehiclePartList[13]);
    }

    return color ?? active;
  }

  Color _onFColorFrontViewMoto(Offset position, Color active, Color inActive) {
    Color? color;

    final x = double.parse(position.dx.toStringAsFixed(2));
    final y = double.parse(position.dy.toStringAsFixed(2));

    if (x > 69 && x < 153 && y > 19 && y < 61) {
      color = damagedParts.contains(vehiclePartList[0]) ? inActive : active;
      selectPartFunc(vehiclePartList[0]);
    } else if (x > 5 && x < 64 && y > 6 && y < 83) {
      color = damagedParts.contains(vehiclePartList[8]) ? inActive : active;
      selectPartFunc(vehiclePartList[8]);
    } else if (x > 160 && x < 218 && y > 6 && y < 83) {
      color = damagedParts.contains(vehiclePartList[9]) ? inActive : active;
      selectPartFunc(vehiclePartList[9]);
    } else if (x > 87 && x < 138 && y > 104 && y < 148) {
      color = damagedParts.contains(vehiclePartList[2]) ? inActive : active;
      selectPartFunc(vehiclePartList[2]);
    }

    return color ?? active;
  }

  Color _onFColorLeftViewMoto(Offset position, Color active, Color inActive) {
    Color? color;

    final x = double.parse(position.dx.toStringAsFixed(2));
    final y = double.parse(position.dy.toStringAsFixed(2));

    if (x > 12 && x < 69 && y > 91 && y < 140) {
      color = damagedParts.contains(vehiclePartList[19]) ? inActive : active;
      selectPartFunc(vehiclePartList[19]);
    } else if (x > 4 && x < 81 && y > 76 && y < 153) {
      color = damagedParts.contains(vehiclePartList[10]) ? inActive : active;
      selectPartFunc(vehiclePartList[10]);
    } else if (x > 58 && x < 86 && y > 16 && y < 74) {
      color = damagedParts.contains(vehiclePartList[12]) ? inActive : active;
      selectPartFunc(vehiclePartList[12]);
    } else if (x > 99 && x < 165 && y > 18 && y < 48) {
      color = damagedParts.contains(vehiclePartList[3]) ? inActive : active;
      selectPartFunc(vehiclePartList[3]);
    } else if (x > 112 && x < 157 && y > 59 && y < 88) {
      color = damagedParts.contains(vehiclePartList[18]) ? inActive : active;
      selectPartFunc(vehiclePartList[18]);
    } else if (x > 120 && x < 170 && y > 96 && y < 130) {
      color = damagedParts.contains(vehiclePartList[17]) ? inActive : active;
      selectPartFunc(vehiclePartList[17]);
    } else if (x > 171 && x < 227 && y > 35 && y < 53) {
      color = damagedParts.contains(vehiclePartList[4]) ? inActive : active;
      selectPartFunc(vehiclePartList[4]);
    } else if (x > 227 && x < 281 && y > 48 && y < 70) {
      color = damagedParts.contains(vehiclePartList[6]) ? inActive : active;
      selectPartFunc(vehiclePartList[6]);
    } else if (x > 181 && x < 199 && y > 115 && y < 131) {
      color = damagedParts.contains(vehiclePartList[7]) ? inActive : active;
      selectPartFunc(vehiclePartList[7]);
    } else if ((x > 221 && x < 236 && y > 91 && y < 109) ||
        (x > 212 && x < 224 && y > 74 && y < 86)) {
      color = damagedParts.contains(vehiclePartList[13]) ? inActive : active;
      selectPartFunc(vehiclePartList[13]);
    } else if (x > 217 && x < 265 && y > 88 && y < 140) {
      color = damagedParts.contains(vehiclePartList[20]) ? inActive : active;
      selectPartFunc(vehiclePartList[20]);
    } else if (x > 206 && x < 274 && y > 74 && y < 154) {
      color = damagedParts.contains(vehiclePartList[11]) ? inActive : active;
      selectPartFunc(vehiclePartList[11]);
    }

    return color ?? active;
  }
}
