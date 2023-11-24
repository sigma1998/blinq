import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/presentation/report/pages/demaged_parts/damaged_parts_screen.dart';
import 'package:blinq/utils/cache_folder.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'damaged_parts_state.dart';

part 'vehicle_info.dart';

class DamagedPartsBloc extends Cubit<DamagedPartsState> {
  final scrollController = ScrollController();
  final VehicleType vehicleType;

  List<String> vehiclePartList = [];

  List<String> vehicleSelect = [];

  DamagedPartsBloc({required this.vehicleType})
      : super(const DamagedPartsState()) {
    switch (vehicleType) {
      case VehicleType.moto:
        vehiclePartList = _motoPartList;
        vehicleSelect = _motoSelect;
        break;
      case VehicleType.van:
        vehiclePartList = _vanPartList;
        vehicleSelect = _vanSelect;
        break;
      case VehicleType.auto:
        vehiclePartList = _carPartList;
        vehicleSelect = _carsSelect;
        break;
    }
  }

  Set<String> damagedParts = {};

  GlobalKey previewCarTop = GlobalKey();
  GlobalKey previewCarFront = GlobalKey();
  GlobalKey previewCarBack = GlobalKey();
  GlobalKey previewCarLeft = GlobalKey();
  GlobalKey previewCarRight = GlobalKey();

  getKey(int index) {
    switch (index) {
      case 0:
        return previewCarTop;
      case 1:
        return previewCarFront;
      case 2:
        return previewCarBack;
      case 3:
        return previewCarLeft;
      case 4:
        return previewCarRight;
    }
  }

  void setPageIndex(int index, double width) {
    // tabController.animateTo(index);

    scrollController.animateTo((width - 48) * index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);

    emit(state.copyWith(pageIndex: index));
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

  void onNextTap(BuildContext context) async {
    await _captureSocialPng(previewCarTop, context);
  }

  Color onFColor(
      {required Offset position,
      required Color active,
      required Color inActive,
      required int index}) {
    if (vehicleType == VehicleType.auto) {
      switch (index) {
        case 0:
          return _onFColorTopViewCar(position, active, inActive);
        case 1:
          return _onFColorFrontViewCar(position, active, inActive);
        case 2:
          return _onFColorBackViewCar(position, active, inActive);
        case 3:
          return _onFColorLeftViewCar(position, active, inActive);
        case 4:
          return _onFColorRightViewCar(position, active, inActive);
      }
    } else if (vehicleType == VehicleType.van) {
      switch (index) {
        case 0:
          return _onFColorTopViewVan(position, active, inActive);
        case 1:
          return _onFColorFrontViewVan(position, active, inActive);
        case 2:
          return _onFColorBackViewVan(position, active, inActive);
        case 3:
          return _onFColorLeftViewVan(position, active, inActive);
        case 4:
          return _onFColorRightViewVan(position, active, inActive);
      }
    }

    return active;
  }

  ///getActiveColorForCar
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

    if (y > 17.96 && y < 47.96) {
      color = damagedParts.contains(vehiclePartList[1]) ? inActive : active;
      selectPartFunc(vehiclePartList[1]);
    } else if (x > 9.0 && x < 24.67 && y < 56.3) {
      color = damagedParts.contains(vehiclePartList[8]) ? inActive : active;
      selectPartFunc(vehiclePartList[8]);
    } else if (x > 216.33 && x < 233.0 && y < 54.3) {
      color = damagedParts.contains(vehiclePartList[9]) ? inActive : active;
      selectPartFunc(vehiclePartList[9]);
    } else if (y > 52.67 && y < 79.01) {
      color = damagedParts.contains(vehiclePartList[0]) ? inActive : active;
      selectPartFunc(vehiclePartList[0]);
    } else if (x > 30.33 && x < 55.67 && y > 76.28 && y < 85.61) {
      color = damagedParts.contains(vehiclePartList[10]) ? inActive : active;
      selectPartFunc(vehiclePartList[10]);
    } else if (x > 186.33 && x < 211.33 && y > 76.95 && y < 85.95) {
      color = damagedParts.contains(vehiclePartList[11]) ? inActive : active;
      selectPartFunc(vehiclePartList[11]);
    } else if (x > 68.33 && x < 172.67 && y > 88.3 && y < 108.97) {
      color = damagedParts.contains(vehiclePartList[12]) ? inActive : active;
      selectPartFunc(vehiclePartList[12]);
    } else if (x > 22.67 &&
        double.parse(position.dx.toStringAsFixed(2)) < 221.33 &&
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
    } else if (x > 30.5 && x < 75.67 && y < 71.0) {
      color = damagedParts.contains(vehiclePartList[5]) ? inActive : active;
      selectPartFunc(vehiclePartList[5]);
    } else if (x > 166.0 && x < 208.67 && y < 71.0) {
      color = damagedParts.contains(vehiclePartList[6]) ? inActive : active;
      selectPartFunc(vehiclePartList[6]);
    } else if (y > 77.1 && y < 139.77 && x > 21.67 && x < 222.0) {
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
    } else if (y > 35.75 && y < 77.09 && x > 98.67 && x < 165.33) {
      color = damagedParts.contains(vehiclePartList[16]) ? inActive : active;
      selectPartFunc(vehiclePartList[24]);
    } else if (y > 35 && y < 75 && x > 171 && x < 228) {
      color = damagedParts.contains(vehiclePartList[25]) ? inActive : active;
      selectPartFunc(vehiclePartList[25]);
    } else if (y > 39.42 && y < 62.75 && x > 37.33 && x < 96.0) {
      color = damagedParts.contains(vehiclePartList[26]) ? inActive : active;
      selectPartFunc(vehiclePartList[26]);
    } else if (y > 22.09 && y < 55.09 && x > 239.33 && x < 297.33) {
      color = damagedParts.contains(vehiclePartList[27]) ? inActive : active;
      selectPartFunc(vehiclePartList[27]);
    } else if (y > 66.75 && y < 90.75 && x > 51.67 && x < 77.0) {
      color = damagedParts.contains(vehiclePartList[28]) ? inActive : active;
      selectPartFunc(vehiclePartList[28]);
    } else if (y > 64.75 && y < 90.75 && x > 235.0 && x < 262.33) {
      color = damagedParts.contains(vehiclePartList[29]) ? inActive : active;
      selectPartFunc(vehiclePartList[29]);
    } else {
      print('NOT FOUND');
    }
    return color ?? active;
  }

  Color _onFColorRightViewCar(Offset position, Color active, Color inActive) {
    Color? color;

    final double y = double.parse(position.dy.toStringAsFixed(2));
    final double x = double.parse(position.dx.toStringAsFixed(2));

    if (y > 13.07 && y < 31 && x < 145.33) {
      color = damagedParts.contains(vehiclePartList[14]) ? inActive : active;
      selectPartFunc(vehiclePartList[14]);
    } else if (y > 13.07 && y < 31 && x > 149.0 && x < 216.33) {
      color = damagedParts.contains(vehiclePartList[15]) ? inActive : active;
      selectPartFunc(vehiclePartList[15]);
    } else if (y > 36.74 && y < 76.07 && x > 154.0 && x < 222.67) {
      color = damagedParts.contains(vehiclePartList[16]) ? inActive : active;
      selectPartFunc(vehiclePartList[16]);
    } else if (y > 37.4 && y < 77.07 && x > 84.67 && x < 151.67) {
      color = damagedParts.contains(vehiclePartList[17]) ? inActive : active;
      selectPartFunc(vehiclePartList[17]);
    } else if (y > 18.84 && y < 47.17 && x > 85.67 && x < 74.33) {
      color = damagedParts.contains(vehiclePartList[18]) ? inActive : active;
      selectPartFunc(vehiclePartList[18]);
    } else if (y > 33.17 && y < 55.51 && x > 199.33 && x < 249.67) {
      color = damagedParts.contains(vehiclePartList[19]) ? inActive : active;
      selectPartFunc(vehiclePartList[19]);
    } else if (y > 58.0 && y < 79.51 && x > 214.0 && x < 240.33) {
      color = damagedParts.contains(vehiclePartList[29]) ? inActive : active;
      selectPartFunc(vehiclePartList[20]);
    } else if (y > 57.51 && y < 79.84 && x > 51.0 && x < 75.0) {
      color = damagedParts.contains(vehiclePartList[21]) ? inActive : active;
      selectPartFunc(vehiclePartList[21]);
    }
    return color ?? active;
  }

  Color _onFColorTopViewVan(Offset position, Color active, Color inActive) {
    Color? color;

    print('y: ${double.parse(position.dy.toStringAsFixed(2))}');
    print('x: ${double.parse(position.dx.toStringAsFixed(2))}');

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

    if (x > 35 && x < 259 && y > 239 && y < 262) {
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
    } else if (x > 3 && x < 28 && y > 111 && y < 141) {
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

    print('x: $x');
    print('y: $y');

    print(vehiclePartList.indexOf('front left wing'.tr()));

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
      ///
    } else if (x > 120 && x < 184 && y > 64 && y < 106) {
      ///
    } else if (x > 190 && x < 263 && y > 64 && y < 106) {
      ///
    }

    return color ?? active;
  }

  Color _onFColorRightViewVan(Offset position, Color active, Color inActive) {
    Color? color;
    if (double.parse(position.dy.toStringAsFixed(2)) > 13.07 &&
        double.parse(position.dy.toStringAsFixed(2)) < 31 &&
        double.parse(position.dx.toStringAsFixed(2)) < 145.33) {
      color = damagedParts.contains(vehiclePartList[14]) ? inActive : active;
      selectPartFunc(vehiclePartList[14]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 13.07 &&
        double.parse(position.dy.toStringAsFixed(2)) < 31 &&
        double.parse(position.dx.toStringAsFixed(2)) > 149.0 &&
        double.parse(position.dx.toStringAsFixed(2)) < 216.33) {
      color = damagedParts.contains(vehiclePartList[15]) ? inActive : active;
      selectPartFunc(vehiclePartList[15]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 36.74 &&
        double.parse(position.dy.toStringAsFixed(2)) < 76.07 &&
        double.parse(position.dx.toStringAsFixed(2)) > 154.0 &&
        double.parse(position.dx.toStringAsFixed(2)) < 222.67) {
      color = damagedParts.contains(vehiclePartList[16]) ? inActive : active;
      selectPartFunc(vehiclePartList[16]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 37.4 &&
        double.parse(position.dy.toStringAsFixed(2)) < 77.07 &&
        double.parse(position.dx.toStringAsFixed(2)) > 84.67 &&
        double.parse(position.dx.toStringAsFixed(2)) < 151.67) {
      color = damagedParts.contains(vehiclePartList[17]) ? inActive : active;
      selectPartFunc(vehiclePartList[17]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 18.84 &&
        double.parse(position.dy.toStringAsFixed(2)) < 47.17 &&
        double.parse(position.dx.toStringAsFixed(2)) > 85.67 &&
        double.parse(position.dx.toStringAsFixed(2)) < 74.33) {
      color = damagedParts.contains(vehiclePartList[18]) ? inActive : active;
      selectPartFunc(vehiclePartList[18]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 33.17 &&
        double.parse(position.dy.toStringAsFixed(2)) < 55.51 &&
        double.parse(position.dx.toStringAsFixed(2)) > 199.33 &&
        double.parse(position.dx.toStringAsFixed(2)) < 249.67) {
      color = damagedParts.contains(vehiclePartList[19]) ? inActive : active;
      selectPartFunc(vehiclePartList[19]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 58.0 &&
        double.parse(position.dy.toStringAsFixed(2)) < 79.51 &&
        double.parse(position.dx.toStringAsFixed(2)) > 214.0 &&
        double.parse(position.dx.toStringAsFixed(2)) < 240.33) {
      color = damagedParts.contains(vehiclePartList[29]) ? inActive : active;
      selectPartFunc(vehiclePartList[20]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 57.51 &&
        double.parse(position.dy.toStringAsFixed(2)) < 79.84 &&
        double.parse(position.dx.toStringAsFixed(2)) > 51.0 &&
        double.parse(position.dx.toStringAsFixed(2)) < 75.0) {
      color = damagedParts.contains(vehiclePartList[21]) ? inActive : active;
      selectPartFunc(vehiclePartList[21]);
    }
    return color ?? active;
  }

  Future<File?> _captureSocialPng(GlobalKey container, BuildContext context) {
    return Future.delayed(const Duration(milliseconds: 20), () async {
      RenderRepaintBoundary? boundary = container.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;

      if (boundary?.debugNeedsLayout == true) {
        NavigationService.showErrorToast('Debug Needs Layout');
        return null;
      }

      /// if it needs repaint, we paint it.
      /// it appears only in debug mode
      /// in profile/release mode should work fine
      if (boundary?.debugNeedsPaint ?? true) {
        await Future.delayed(const Duration(milliseconds: 500));
        // ignore: use_build_context_synchronously
        return await _captureSocialPng(container, context);
      }

      ui.Image image = await boundary!.toImage();
      final directory = await FileUtil.createFolderInAppDocDir();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      File imgFile =
          File('$directory/${DateTime.now().millisecondsSinceEpoch}.png');
      imgFile.writeAsBytes(pngBytes);
      print(imgFile.path);
      return imgFile;
    });
  }
}
