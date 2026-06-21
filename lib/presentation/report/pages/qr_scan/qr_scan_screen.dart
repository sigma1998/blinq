import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:blinq/core/drawables/app_text_styles.dart';
import 'package:blinq/core/theme/app_colors.dart';
import 'package:blinq/utils/components/app_bar/save_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../utils/navigation_service.dart';
import '../second_driver/second_driver_screen.dart';

class QrScanScreen extends StatefulWidget {
  static const route = '/qr_scan';

  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  bool isDetected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SaveAppBar(title: 'Accident - A driver part'),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AiBarcodeScanner(
                    appBarBuilder: (context, controller) => const PreferredSize(
                      preferredSize: Size.zero,
                      child: SizedBox.shrink(),
                    ),
                    galleryButtonType: GalleryButtonType.none,
                    overlayConfig: const ScannerOverlayConfig(
                        // Change the animation style
                        scannerAnimation: ScannerAnimation.fullWidth,
                        // Change the border style
                        scannerBorder: ScannerBorder.full,
                        // Customize colors
                        borderColor: Colors.transparent,
                        successColor: Colors.teal,
                        errorColor: Colors.orange,
                        animationColor: Colors.white,
                        // Adjust corner radius
                        cornerLength: 50,
                        borderRadius: 0),
                    galleryButtonAlignment: Alignment.bottomCenter,
                    controller: MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates),
                    onDetect: (BarcodeCapture barcodeCapture) {
                      if (isDetected) return;

                      isDetected = true;
                      final map = barcodeCapture.raw as Map;
                      final list = map['data'] as List;
                      final res = list.first as Map;
                      final displayValue = res['displayValue'] as String;
                      final userId = int.parse(displayValue.replaceAll("{'user_id':", '').replaceAll('}', ''));
                      NavigationService.pushReplacement(
                        routeName: SecondDriverScreen.route,
                        arguments: userId,
                        nestedKey: NavigationService.homeNavigatorKey,
                      );
                    },
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 68,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withAlpha(250),
                            Colors.black.withAlpha(240),
                            Colors.black.withAlpha(230),
                            Colors.black.withAlpha(220),
                            Colors.black.withAlpha(210),
                            Colors.black.withAlpha(200),
                            Colors.black.withAlpha(190),
                            Colors.black.withAlpha(180),
                            Colors.black.withAlpha(175),
                            Colors.black.withAlpha(160),
                            Colors.black.withAlpha(150),
                            Colors.black.withAlpha(140),
                            Colors.black.withAlpha(130),
                            Colors.black.withAlpha(120),
                            Colors.black.withAlpha(110),
                            Colors.black.withAlpha(100),
                          ],
                        ),
                      ),
                      child: Text(
                        'Use scan',
                        style: AppTextStyles.s28W600.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              border: Border.all(
                                color: AppColors.white,
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: AppTextStyles.s17W600.copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
