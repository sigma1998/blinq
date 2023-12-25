// Dart imports:
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// Project imports:
import 'package:blinq/presentation/report/pages/second_driver/second_driver_screen.dart';
import 'package:blinq/utils/custom_widgets/buttons/default_button.dart';
import 'package:blinq/utils/navigation_service.dart';

class QrScanScreen extends StatefulWidget {
  //
  static const route = '/qr_scan';

  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  //
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool _isScanned = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderWidth: 8,
                  cutOutSize: 266,
                  borderLength: 30,
                  borderColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    'strUseScan'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'strConnectTogether'.tr(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton.tertiary(
              label: 'strCancel'.tr(),
              onTap: () =>
                  NavigationService.homeNavigatorKey.currentState?.pop(),
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 24,
              ),
              margin: const EdgeInsets.only(bottom: 50),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((data) {
      if (_isScanned) return;
      final userJson = jsonDecode(data.code?.replaceAll('\'', '"') ?? '{}');
      debugPrint('userJson: $userJson');
      NavigationService.pushReplacement(
          routeName: SecondDriverScreen.route,
          arguments: userJson['user_id'],
          nestedKey: NavigationService.homeNavigatorKey);
      _isScanned = true;
    });
  }
}
