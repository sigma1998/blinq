import 'dart:convert';

import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 800,
              child: Scaffold(
                body: AiBarcodeScanner(
                  // showSuccess: true,
                  // cutOutBottomOffset: 0,
                  // hideSheetDragHandler: true,
                  // hideSheetTitle: true,
                  galleryButtonAlignment: Alignment.bottomCenter,
                  controller: MobileScannerController(
                    detectionSpeed: DetectionSpeed.noDuplicates,
                  ),
                  onDetect: (BarcodeCapture barcodeCapture) {
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
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 32,
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const SizedBox(height: 60),
            //       Text(
            //         'strUseScan'.tr(),
            //         style: Theme.of(context).textTheme.titleMedium,
            //       ),
            //       const SizedBox(height: 24),
            //       Text(
            //         'strConnectTogether'.tr(),
            //         style: Theme.of(context).textTheme.titleMedium!.copyWith(
            //               color: Theme.of(context).colorScheme.outline,
            //             ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
        // floatingActionButton: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     MyButton.tertiary(
        //       label: 'strCancel'.tr(),
        //       onTap: () =>
        //           NavigationService.homeNavigatorKey.currentState?.pop(),
        //       padding: const EdgeInsets.symmetric(
        //         vertical: 12,
        //         horizontal: 24,
        //       ),
        //       margin: const EdgeInsets.only(bottom: 50),
        //     ),
        //   ],
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

// void _onQRViewCreated(QRViewController controller) {
//   this.controller = controller;
//   controller.scannedDataStream.listen((data) {
//     if (_isScanned) return;
//     final userJson = jsonDecode(data.code?.replaceAll('\'', '"') ?? '{}');
//     debugPrint('userJson: $userJson');
//     NavigationService.pushReplacement(
//         routeName: SecondDriverScreen.route,
//         arguments: userJson['user_id'],
//         nestedKey: NavigationService.homeNavigatorKey);
//     _isScanned = true;
//   });
// }
}
