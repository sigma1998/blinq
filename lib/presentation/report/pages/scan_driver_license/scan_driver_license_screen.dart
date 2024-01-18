// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:blinq/presentation/report/pages/scan_driver_license/cubit/scan_driver_license_cubit.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/custom_widgets/buttons/navigation_button.dart';
import 'package:blinq/utils/generic_bloc_state.dart';

class ScanDriverLicense extends StatefulWidget {
  //
  static const route = '/scan_driver_license';

  const ScanDriverLicense({super.key});

  @override
  State<ScanDriverLicense> createState() => _ScanDriverLicenseState();
}

class _ScanDriverLicenseState extends State<ScanDriverLicense> {
  //
  late final ScanDriverLicenseCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ScanDriverLicenseCubit>();
    _cubit.initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanDriverLicenseCubit, ScanDriverLicenseState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              state.controllerIsInitialized
                  ? _cameraWidget(context)
                  : Container(),
              const OverlayWithRectangleClipping(),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      'strInformationDriver'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'strScanDriverLicense'.tr(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 120,
                left: 32,
                right: 32,
                child: Row(
                  children: [
                    const NavigationButton(padding: 0),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyButton.primary(
                        label: 'strScan'.tr(),
                        onTap: _cubit.onScanPressed,
                        isLoading: state.status == Status.loading,
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: _cubit.onSkipPressed,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'strSkip'.tr(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _cameraWidget(context) {
    if (!_cubit.controller.value.isInitialized) {
      return Container();
    }

    var camera = _cubit.controller.value;
    final size = MediaQuery.of(context).size;

    var scale = size.aspectRatio * camera.aspectRatio;

    if (scale < 1) scale = 1 / scale;

    return Transform.scale(
      scale: scale,
      child: Center(
        child: CameraPreview(_cubit.controller),
      ),
    );
  }
}

class OverlayWithRectangleClipping extends StatelessWidget {
  //
  const OverlayWithRectangleClipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _getCustomPaintOverlay(context),
    );
  }

  CustomPaint _getCustomPaintOverlay(BuildContext context) {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: RectanglePainter(),
    );
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;
    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addPath(
        Path.combine(
          PathOperation.difference,
          //bellow draws a rectangle of full screen (parent) size
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          //bellow clips out the circular rectangle with center as offset and dimensions you need to set
          Path()
            ..addRRect(
              RRect.fromRectAndRadius(
                Rect.fromCenter(
                  center: Offset(size.width * 0.5, size.height * 0.55),
                  width: size.width * 0.88,
                  height: size.height * 0.28,
                ),
                const Radius.circular(10),
              ),
            )
            ..close(),
        ),
        Offset.zero,
      );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
