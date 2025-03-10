import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_keyboard/pin_keyboard.dart';
import 'package:test_isaac_sanchez/core/services/global_functions.dart';
import 'package:test_isaac_sanchez/core/ui/design/atoms/text/custom_text.dart';
import 'package:test_isaac_sanchez/core/ui/utils/paths/colors/colors_ui.dart';
import 'package:test_isaac_sanchez/feature/auth/security_code/presentation/controller/security_code_controller.dart';

import '../../../../../core/ui/utils/routes/routes.dart';

class SecurityCodePage extends ConsumerStatefulWidget {
  const SecurityCodePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SecurityCodePageState();
}

class _SecurityCodePageState extends ConsumerState<SecurityCodePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => initData());
  }

  initData() async {
    var controller = ref.watch(securityCodeController.notifier);
    String validator = await globalFunctions.getCode();
    if (validator.toString() == 'null' || validator.isEmpty) {
      globalFunctions.validateRegisterCode(value: 'null', values: true);
    } else {
      globalFunctions.validateRegisterCode(
          value: validator.toString(), values: false);
    }
    controller.updateValidatorCode(validator.toString());
    controller.updateError(false);
  }

  saveCode(context) async {
    globalFunctions.loading(context);
    var state = ref.read(securityCodeController);
    var controller = ref.watch(securityCodeController.notifier);
    String validator = await globalFunctions.getCode();
    bool firsTime = await globalFunctions.getFirstTime();
    Navigator.pop(context);
    if (firsTime) {
      globalFunctions.validateRegisterCode(
          value: state.code.toString(), values: false);
      routes.mainExplore(context: context);
    } else {
      if (validator.toString() == state.code.toString()) {
        controller.updateError(false);
        controller.updateValidatorCode(state.code.toString());
        routes.mainExplore(context: context);
      } else {
        controller.updateError(true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(securityCodeController);
    var controller = ref.watch(securityCodeController.notifier);
    return PopScope(
        canPop: false,
        child: Scaffold(
          body: SafeArea(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: CustomText(
                                      title: state.codeValidator == 'null'
                                          ? 'register'.tr()
                                          : 'input'.tr(),
                                      fontSize: 25,
                                      color: colorsUI.primary800,
                                      align: TextAlign.center,
                                      fontWeight: FontWeight.w500),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 8.sp,
                                  child: GestureDetector(
                                      onTap: () =>
                                          routes.signIn(context: context),
                                      child: Icon(Icons.arrow_back_ios)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          if (state.codeValidator.toString() == 'null') ...[
                            CustomText(
                                title: 'message'.tr(),
                                fontSize: 12,
                                color: colorsUI.neutral500,
                                align: TextAlign.center,
                                fontWeight: FontWeight.w500),
                          ]
                        ],
                      ),
                      CustomText(
                          title: globalFunctions.changeCode(state.code ?? ''),
                          fontSize: 35,
                          color: colorsUI.primary500,
                          align: TextAlign.center,
                          fontWeight: FontWeight.w500),
                      if (state.error == true) ...[
                        CustomText(
                            title: 'error'.tr(),
                            fontSize: 10,
                            color: colorsUI.error500,
                            align: TextAlign.center,
                            fontWeight: FontWeight.w500),
                      ],
                      PinKeyboard(
                        length: 4,
                        textColor: colorsUI.primary500,
                        fontSize: 30.sp,
                        iconBackspace: GestureDetector(
                          onTap: () =>
                              controller.deleteCode(state.code.toString()),
                          child: Icon(
                            Icons.backspace_outlined,
                            color: colorsUI.error500,
                            size: 25.sp,
                          ),
                        ),
                        space: 80.sp,
                        enableBiometric: false,
                        onChange: (pin) {
                          controller.updateCode(pin);
                          debugPrint(pin);
                        },
                        onConfirm: (pin) {
                          saveCode(context);
                        },
                      )
                    ],
                  ))),
        ));
  }
}
