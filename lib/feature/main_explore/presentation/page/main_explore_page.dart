import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:test_isaac_sanchez/core/ui/design/atoms/text/custom_text.dart';
import 'package:test_isaac_sanchez/core/ui/utils/paths/colors/colors_ui.dart';
import 'package:test_isaac_sanchez/feature/main_explore/presentation/controller/main_explore_controller.dart';

import '../../../../core/ui/utils/routes/routes.dart';

class MainExplorePage extends ConsumerStatefulWidget {
  const MainExplorePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainExplorePageState();
}

class _MainExplorePageState extends ConsumerState<MainExplorePage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  onQRViewCreated(QRViewController controller) async {
    var controllerQr = ref.watch(mainExploreController.notifier);
    // Asegúrate de no sobrescribir el controlador si ya está inicializado.
    if (this.controller != null) {
      return;
    }
    this.controller = controller;
    await Future.delayed(Duration(milliseconds: 500));
    controller.scannedDataStream.listen((scanData) async {
      if (scanData.code!.isNotEmpty) {
        setState(() {
          result = scanData;
        });
        controllerQr.updateValue(result!.code.toString());
      }
    });
    if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    // Asegúrate de pausar y reanudar la cámara solo si es necesario.
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void dispose() {
    // Asegúrate de liberar el controlador cuando se elimine la vista.
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.read(mainExploreController);
    return PopScope(
        canPop: false,
        child: Scaffold(
          body: SafeArea(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: CustomText(
                                  title: 'scanner'.tr(),
                                  fontSize: 25,
                                  color: colorsUI.primary800,
                                  align: TextAlign.center,
                                  fontWeight: FontWeight.w500),
                            ),
                            Positioned(
                              left: 0,
                              top: 8.sp,
                              child: GestureDetector(
                                  onTap: () => routes.signIn(context: context),
                                  child: Icon(Icons.arrow_back_ios)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 500.sp,
                        child: QRView(
                          key: qrKey,
                          onQRViewCreated: (x) => onQRViewCreated(x),
                          overlay: QrScannerOverlayShape(
                            borderColor: Colors.black,
                            borderRadius: 10,
                            borderLength: 30,
                            borderWidth: 10,
                            cutOutSize: 300,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      CustomText(
                          title: state.value ?? '',
                          fontSize: 18,
                          color: colorsUI.primary800,
                          align: TextAlign.center,
                          fontWeight: FontWeight.w500)
                    ],
                  ))),
        ));
  }
}
