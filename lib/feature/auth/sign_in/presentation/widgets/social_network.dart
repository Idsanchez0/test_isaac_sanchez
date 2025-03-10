import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../core/services/global_data.dart';
import '../../../../../core/services/global_functions.dart';
import '../../../../../core/ui/design/atoms/text/custom_text.dart';
import '../../../../../core/ui/utils/paths/colors/colors_ui.dart';

class SocialNetwork extends StatefulWidget {
  const SocialNetwork({super.key});

  @override
  State<SocialNetwork> createState() => _SocialNetwork();
}

class _SocialNetwork extends State<SocialNetwork> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => globalFunctions.launchPage(url: globalData.linkedin),
              child: Column(
                children: [
                  Icon(
                    PhosphorIconsFill.linkedinLogo,
                    size: 30.sp,
                    color: colorsUI.primary400,
                  ),
                  CustomText(
                      title: 'linkedIn'.tr(),
                      fontSize: 10,
                      color: colorsUI.primary400,
                      align: TextAlign.center,
                      fontWeight: FontWeight.w500)
                ],
              )),
          GestureDetector(
              onTap: () => globalFunctions.launchPage(url: globalData.whatsapp),
              child: Column(
                children: [
                  Icon(
                    PhosphorIcons.whatsappLogo(),
                    size: 30.sp,
                    color: colorsUI.primary400,
                  ),
                  CustomText(
                      title: 'whatsapp'.tr(),
                      fontSize: 10,
                      color: colorsUI.primary400,
                      align: TextAlign.center,
                      fontWeight: FontWeight.w500)
                ],
              )),
          GestureDetector(
              onTap: () => globalFunctions.launchPage(url: globalData.web),
              child: Column(
                children: [
                  Icon(
                    PhosphorIcons.googleChromeLogo(),
                    size: 30.sp,
                    color: colorsUI.primary400,
                  ),
                  CustomText(
                      title: 'web'.tr(),
                      fontSize: 10,
                      color: colorsUI.primary400,
                      align: TextAlign.center,
                      fontWeight: FontWeight.w500)
                ],
              )),
        ],
      ),
    );
  }
}
