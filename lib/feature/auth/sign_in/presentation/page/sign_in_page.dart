import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:test_isaac_sanchez/core/services/global_functions.dart';
import 'package:test_isaac_sanchez/core/ui/design/atoms/text/custom_text.dart';
import 'package:test_isaac_sanchez/core/ui/utils/paths/animations/animations_ui.dart';
import 'package:test_isaac_sanchez/core/ui/utils/paths/colors/colors_ui.dart';
import 'package:test_isaac_sanchez/feature/auth/sign_in/presentation/controller/sign_in_controller.dart';
import 'package:test_isaac_sanchez/feature/auth/sign_in/presentation/widgets/buttons.dart';
import 'package:test_isaac_sanchez/feature/auth/sign_in/presentation/widgets/social_network.dart';

import '../../../../../core/ui/utils/routes/routes.dart';
import '../../../security_code/presentation/controller/security_code_controller.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  loginBiometric(context) async {
    globalFunctions.loading(context);
    var controller = ref.watch(signInController.notifier);
    bool res = await controller.loginBiometric();
    if (res) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
        routes.mainExplore(context: context);
      });
    } else {
      Navigator.pop(context);
      loginCode();
    }
  }

  loginCode() {
    globalFunctions.loading(context);
    var controller = ref.watch(securityCodeController.notifier);
    controller.updateCode('');
    Navigator.pop(context);
    routes.securityCode(context: context);
  }

  changeLanguage(String value, String lang) {
    globalFunctions.changeLanguage(context, Locale(value, lang));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          body: SafeArea(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: CustomText(
                              title: 'welcome'.tr(),
                              fontSize: 20,
                              color: colorsUI.primary800,
                              align: TextAlign.center,
                              fontWeight: FontWeight.w500)),
                      Lottie.asset(animationsUI.security, fit: BoxFit.fill),
                      Align(
                          alignment: Alignment.center,
                          child: CustomText(
                              title: 'security'.tr(),
                              fontSize: 10,
                              color: colorsUI.primary800,
                              align: TextAlign.center,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 40.sp,
                      ),
                      Buttons(
                        biometric: () => loginBiometric(context),
                        code: () => loginCode(),
                        changeLanguage: (x, y) => changeLanguage(x, y),
                      ),
                      SizedBox(
                        height: 60.sp,
                      ),
                      SocialNetwork()
                    ],
                  ))),
        ));
  }
}
