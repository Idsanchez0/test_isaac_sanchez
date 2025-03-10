import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_isaac_sanchez/core/ui/design/templates/cards/language_modal_card.dart';

import '../../../../../core/ui/design/atoms/text/custom_text.dart';
import '../../../../../core/ui/design/molecules/buttons/button_card.dart';
import '../../../../../core/ui/design/templates/modals/bottom_modal_template.dart';
import '../../../../../core/ui/utils/paths/colors/colors_ui.dart';

class Buttons extends StatefulWidget {
  final Function biometric;
  final Function code;
  final Function changeLanguage;

  const Buttons(
      {super.key,
      required this.biometric,
      required this.code,
      required this.changeLanguage});

  @override
  State<Buttons> createState() => _Buttons();
}

class _Buttons extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 100.sp,
            child: GestureDetector(
              onTap: () => widget.biometric(),
              child: ButtonCard(
                  child: Column(
                children: [
                  Icon(
                    Icons.fingerprint,
                    size: 30.sp,
                    color: colorsUI.primary700,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  CustomText(
                      title: 'biometric'.tr(),
                      fontSize: 12,
                      color: colorsUI.primary700,
                      align: TextAlign.center,
                      fontWeight: FontWeight.w500)
                ],
              )),
            )),
        SizedBox(
          width: 100.sp,
          child: GestureDetector(
              onTap: () => widget.code(),
              child: ButtonCard(
                  child: Column(
                children: [
                  Icon(
                    Icons.dialpad,
                    size: 30.sp,
                    color: colorsUI.primary700,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  CustomText(
                      title: 'code'.tr(),
                      fontSize: 12,
                      color: colorsUI.primary700,
                      align: TextAlign.center,
                      fontWeight: FontWeight.w500)
                ],
              ))),
        ),
        SizedBox(
          width: 100.sp,
          child: GestureDetector(
              onTap: () => bottomModals.topModal(
                  context: context,
                  child: LanguageModalCard(
                    changeLanguage: (x, y) => widget.changeLanguage(x, y),
                  ),
                  color: colorsUI.white),
              child: ButtonCard(
                  child: Column(
                children: [
                  Icon(
                    Icons.translate,
                    size: 30.sp,
                    color: colorsUI.primary700,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  CustomText(
                      title: 'languages'.tr(),
                      fontSize: 12,
                      color: colorsUI.primary700,
                      align: TextAlign.center,
                      fontWeight: FontWeight.w500)
                ],
              ))),
        )
      ],
    );
  }
}
