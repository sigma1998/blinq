import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:blinq/core/drawables/app_drawables.dart';
import 'package:blinq/utils/cache_folder.dart';
import 'package:blinq/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'damaged_parts_state.dart';

class DamagedPartsBloc extends Cubit<DamagedPartsState> {
  final scrollController = ScrollController();

  DamagedPartsBloc() : super(const DamagedPartsState()) {}

  Set<String> damagedParts = {};

  List<String> carsSelect = [
    AppDrawables.carTop,
    AppDrawables.carFront,
    AppDrawables.carBack,
    AppDrawables.carLeft,
    AppDrawables.carRight,
  ];

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

  List<String> carPartList = [
    'front',
    'windscreen',
    'roof',
    'rear window',
    'car trunk',
    'rear left headlight',
    'rear right headlight',
    'rear bumper',
    'right side view mirror',
    'left side view mirror',
    'front right headlight',
    'front left headlight',
    "front grille",
    'front bumper',
    // --------------
    "rear right window",
    "front right window",
    "front right door",
    "rear right door",
    "rear right wing",
    "front right wing",
    "front right tire",
    "rear right tire",
    // --------------
    "front left window",
    "rear left window",
    "front left door",
    "rear left door",
    "front left wing",
    "rear left wing",
    "front left tire",
    "rear left tire",
  ];

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
    switch (index) {
      case 0:
        return _onFColorTopView(position, active, inActive);
      case 1:
        return _onFColorFrontView(position, active, inActive);
      case 2:
        return _onFColorBackView(position, active, inActive);
      case 3:
        return _onFColorLeftView(position, active, inActive);
      case 4:
        return _onFColorRightView(position, active, inActive);
    }

    return active;
  }

  Color _onFColorTopView(Offset position, Color active, Color inActive) {
    Color? color;
    if (double.parse(position.dy.toStringAsFixed(2)) > 11.54 &&
        double.parse(position.dy.toStringAsFixed(2)) < 73.21) {
      color = damagedParts.contains(carPartList[0]) ? inActive : active;
      selectPartFunc(carPartList[0]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 80.21 &&
        double.parse(position.dy.toStringAsFixed(2)) < 133.88) {
      color = damagedParts.contains(carPartList[1]) ? inActive : active;
      selectPartFunc(carPartList[1]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 142.21 &&
        double.parse(position.dy.toStringAsFixed(2)) < 249.21) {
      color = damagedParts.contains(carPartList[2]) ? inActive : active;
      selectPartFunc(carPartList[2]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 260.21 &&
        double.parse(position.dy.toStringAsFixed(2)) < 308.88) {
      color = damagedParts.contains(carPartList[3]) ? inActive : active;
      selectPartFunc(carPartList[3]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 318.84 &&
        double.parse(position.dy.toStringAsFixed(2)) < 333.51) {
      color = damagedParts.contains(carPartList[4]) ? inActive : active;
      selectPartFunc(carPartList[4]);
    }
    return color ?? active;
  }

  Color _onFColorFrontView(Offset position, Color active, Color inActive) {
    Color? color;
    if (double.parse(position.dy.toStringAsFixed(2)) > 17.96 &&
        double.parse(position.dy.toStringAsFixed(2)) < 47.96) {
      color = damagedParts.contains(carPartList[1]) ? inActive : active;
      selectPartFunc(carPartList[1]);
    } else if (double.parse(position.dx.toStringAsFixed(2)) > 9.0 &&
        double.parse(position.dx.toStringAsFixed(2)) < 24.67 &&
        double.parse(position.dy.toStringAsFixed(2)) < 56.3) {
      color = damagedParts.contains(carPartList[8]) ? inActive : active;
      selectPartFunc(carPartList[8]);
    } else if (double.parse(position.dx.toStringAsFixed(2)) > 216.33 &&
        double.parse(position.dx.toStringAsFixed(2)) < 233.0 &&
        double.parse(position.dy.toStringAsFixed(2)) < 54.3) {
      color = damagedParts.contains(carPartList[9]) ? inActive : active;
      selectPartFunc(carPartList[9]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 52.67 &&
        double.parse(position.dy.toStringAsFixed(2)) < 79.01) {
      color = damagedParts.contains(carPartList[0]) ? inActive : active;
      selectPartFunc(carPartList[0]);
    } else if (double.parse(position.dx.toStringAsFixed(2)) > 30.33 &&
        double.parse(position.dx.toStringAsFixed(2)) < 55.67 &&
        double.parse(position.dy.toStringAsFixed(2)) > 76.28 &&
        double.parse(position.dy.toStringAsFixed(2)) < 85.61) {
      color = damagedParts.contains(carPartList[10]) ? inActive : active;
      selectPartFunc(carPartList[10]);
    } else if (double.parse(position.dx.toStringAsFixed(2)) > 186.33 &&
        double.parse(position.dx.toStringAsFixed(2)) < 211.33 &&
        double.parse(position.dy.toStringAsFixed(2)) > 76.95 &&
        double.parse(position.dy.toStringAsFixed(2)) < 85.95) {
      color = damagedParts.contains(carPartList[11]) ? inActive : active;
      selectPartFunc(carPartList[11]);
    } else if (double.parse(position.dx.toStringAsFixed(2)) > 68.33 &&
        double.parse(position.dx.toStringAsFixed(2)) < 172.67 &&
        double.parse(position.dy.toStringAsFixed(2)) > 88.3 &&
        double.parse(position.dy.toStringAsFixed(2)) < 108.97) {
      color = damagedParts.contains(carPartList[12]) ? inActive : active;
      selectPartFunc(carPartList[12]);
    } else if (double.parse(position.dx.toStringAsFixed(2)) > 22.67 &&
        double.parse(position.dx.toStringAsFixed(2)) < 221.33 &&
        double.parse(position.dy.toStringAsFixed(2)) > 89.97 &&
        double.parse(position.dy.toStringAsFixed(2)) < 138.97) {
      color = damagedParts.contains(carPartList[13]) ? inActive : active;
      selectPartFunc(carPartList[13]);
    }
    return color ?? active;
  }

  Color _onFColorBackView(Offset position, Color active, Color inActive) {
    Color? color;
    if (double.parse(position.dy.toStringAsFixed(2)) > 22.43 &&
        double.parse(position.dy.toStringAsFixed(2)) < 43.77) {
      color = damagedParts.contains(carPartList[3]) ? inActive : active;
      selectPartFunc(carPartList[3]);
    } else if (double.parse(position.dx.toStringAsFixed(2)) > 30.5 &&
        double.parse(position.dx.toStringAsFixed(2)) < 75.67 &&
        double.parse(position.dy.toStringAsFixed(2)) < 71.0) {
      color = damagedParts.contains(carPartList[5]) ? inActive : active;
      selectPartFunc(carPartList[5]);
    } else if (double.parse(position.dx.toStringAsFixed(2)) > 166.0 &&
        double.parse(position.dx.toStringAsFixed(2)) < 208.67 &&
        double.parse(position.dy.toStringAsFixed(2)) < 71.0) {
      color = damagedParts.contains(carPartList[6]) ? inActive : active;
      selectPartFunc(carPartList[6]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 77.1 &&
        double.parse(position.dy.toStringAsFixed(2)) < 139.77 &&
        double.parse(position.dx.toStringAsFixed(2)) > 21.67 &&
        double.parse(position.dx.toStringAsFixed(2)) < 222.0) {
      color = damagedParts.contains(carPartList[7]) ? inActive : active;
      selectPartFunc(carPartList[7]);
    }
    return color ?? active;
  }

  Color _onFColorLeftView(Offset position, Color active, Color inActive) {

    Color? color;
    if (double.parse(position.dy.toStringAsFixed(2)) > 11.75 &&
        double.parse(position.dy.toStringAsFixed(2)) < 30.42 &&
        double.parse(position.dx.toStringAsFixed(2)) < 172.33) {
      color = damagedParts.contains(carPartList[22]) ? inActive : active;
      selectPartFunc(carPartList[22]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 10.75 &&
        double.parse(position.dy.toStringAsFixed(2)) < 28.75 &&
        double.parse(position.dx.toStringAsFixed(2)) > 176.33 &&
        double.parse(position.dx.toStringAsFixed(2)) < 229.67) {
      color = damagedParts.contains(carPartList[23]) ? inActive : active;
      selectPartFunc(carPartList[23]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 35.75 &&
        double.parse(position.dy.toStringAsFixed(2)) < 77.09 &&
        double.parse(position.dx.toStringAsFixed(2)) > 98.67 &&
        double.parse(position.dx.toStringAsFixed(2)) < 165.33) {
      color = damagedParts.contains(carPartList[16]) ? inActive : active;
      selectPartFunc(carPartList[24]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 35 &&
        double.parse(position.dy.toStringAsFixed(2)) < 75 &&
        double.parse(position.dx.toStringAsFixed(2)) > 171 &&
        double.parse(position.dx.toStringAsFixed(2)) < 228) {
      color = damagedParts.contains(carPartList[25]) ? inActive : active;
      selectPartFunc(carPartList[25]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 39.42 &&
        double.parse(position.dy.toStringAsFixed(2)) < 62.75 &&
        double.parse(position.dx.toStringAsFixed(2)) > 37.33 &&
        double.parse(position.dx.toStringAsFixed(2)) < 96.0) {
      color = damagedParts.contains(carPartList[26]) ? inActive : active;
      selectPartFunc(carPartList[26]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 22.09 &&
        double.parse(position.dy.toStringAsFixed(2)) < 55.09 &&
        double.parse(position.dx.toStringAsFixed(2)) > 239.33 &&
        double.parse(position.dx.toStringAsFixed(2)) < 297.33) {
      color = damagedParts.contains(carPartList[27]) ? inActive : active;
      selectPartFunc(carPartList[27]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 66.75 &&
        double.parse(position.dy.toStringAsFixed(2)) < 90.75 &&
        double.parse(position.dx.toStringAsFixed(2)) > 51.67 &&
        double.parse(position.dx.toStringAsFixed(2)) < 77.0) {
      color = damagedParts.contains(carPartList[28]) ? inActive : active;
      selectPartFunc(carPartList[28]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 64.75 &&
        double.parse(position.dy.toStringAsFixed(2)) < 90.75 &&
        double.parse(position.dx.toStringAsFixed(2)) > 235.0 &&
        double.parse(position.dx.toStringAsFixed(2)) < 262.33) {
      color = damagedParts.contains(carPartList[29]) ? inActive : active;
      selectPartFunc(carPartList[29]);
    } else {
      print('NOT FOUND');
    }
    return color ?? active;
  }

  Color _onFColorRightView(Offset position, Color active, Color inActive) {
    Color? color;
    if (double.parse(position.dy.toStringAsFixed(2)) > 13.07 &&
        double.parse(position.dy.toStringAsFixed(2)) < 31 &&
        double.parse(position.dx.toStringAsFixed(2)) < 145.33) {
      color = damagedParts.contains(carPartList[14]) ? inActive : active;
      selectPartFunc(carPartList[14]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 13.07 &&
        double.parse(position.dy.toStringAsFixed(2)) < 31 &&
        double.parse(position.dx.toStringAsFixed(2)) > 149.0 &&
        double.parse(position.dx.toStringAsFixed(2)) < 216.33) {
      color = damagedParts.contains(carPartList[15]) ? inActive : active;
      selectPartFunc(carPartList[15]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 36.74 &&
        double.parse(position.dy.toStringAsFixed(2)) < 76.07 &&
        double.parse(position.dx.toStringAsFixed(2)) > 154.0 &&
        double.parse(position.dx.toStringAsFixed(2)) < 222.67) {
      color = damagedParts.contains(carPartList[16]) ? inActive : active;
      selectPartFunc(carPartList[16]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 37.4 &&
        double.parse(position.dy.toStringAsFixed(2)) < 77.07 &&
        double.parse(position.dx.toStringAsFixed(2)) > 84.67 &&
        double.parse(position.dx.toStringAsFixed(2)) < 151.67) {
      color = damagedParts.contains(carPartList[17]) ? inActive : active;
      selectPartFunc(carPartList[17]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 18.84 &&
        double.parse(position.dy.toStringAsFixed(2)) < 47.17 &&
        double.parse(position.dx.toStringAsFixed(2)) > 85.67 &&
        double.parse(position.dx.toStringAsFixed(2)) < 74.33) {
      color = damagedParts.contains(carPartList[18]) ? inActive : active;
      selectPartFunc(carPartList[18]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 33.17 &&
        double.parse(position.dy.toStringAsFixed(2)) < 55.51 &&
        double.parse(position.dx.toStringAsFixed(2)) > 199.33 &&
        double.parse(position.dx.toStringAsFixed(2)) < 249.67) {
      color = damagedParts.contains(carPartList[19]) ? inActive : active;
      selectPartFunc(carPartList[19]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 58.0 &&
        double.parse(position.dy.toStringAsFixed(2)) < 79.51 &&
        double.parse(position.dx.toStringAsFixed(2)) > 214.0 &&
        double.parse(position.dx.toStringAsFixed(2)) < 240.33) {
      color = damagedParts.contains(carPartList[29]) ? inActive : active;
      selectPartFunc(carPartList[20]);
    } else if (double.parse(position.dy.toStringAsFixed(2)) > 57.51 &&
        double.parse(position.dy.toStringAsFixed(2)) < 79.84 &&
        double.parse(position.dx.toStringAsFixed(2)) > 51.0 &&
        double.parse(position.dx.toStringAsFixed(2)) < 75.0) {
      color = damagedParts.contains(carPartList[21]) ? inActive : active;
      selectPartFunc(carPartList[21]);
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
