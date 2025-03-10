import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../services/global_functions.dart';
import '../../../utils/paths/colors/colors_ui.dart';
import '../../../utils/paths/icons/icons_ui.dart';
import '../../atoms/text/custom_text.dart';

class LanguageModalCard extends StatefulWidget {
  final Function changeLanguage;

  const LanguageModalCard({super.key, required this.changeLanguage});

  @override
  State<LanguageModalCard> createState() => _LanguageModalCard();
}

class _LanguageModalCard extends State<LanguageModalCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20.sp,
        ),
        GestureDetector(
          onTap: () {
            widget.changeLanguage('es', 'ES');
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
                color: globalFunctions.getLanguage(context) == 'ES'
                    ? colorsUI.neutral200
                    : colorsUI.white,
                borderRadius: BorderRadius.all(Radius.circular(10.sp))),
            margin: EdgeInsets.symmetric(horizontal: 20.sp),
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
            child: Row(
              children: [
                Image.asset(
                  iconsUI.es,
                  height: 25.sp,
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                    child: CustomText(
                        title: 'spanish'.tr(),
                        fontSize: 15,
                        color: colorsUI.black,
                        align: TextAlign.start,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  width: 10.sp,
                ),
                Icon(
                  PhosphorIconsFill.checkCircle,
                  size: 20.sp,
                  color: globalFunctions.getLanguage(context) == 'ES'
                      ? colorsUI.success500
                      : colorsUI.black,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15.sp,
        ),
        GestureDetector(
          onTap: () {
            widget.changeLanguage('en', 'US');
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
                color: globalFunctions.getLanguage(context) == 'EN'
                    ? colorsUI.neutral200
                    : colorsUI.white,
                borderRadius: BorderRadius.all(Radius.circular(10.sp))),
            margin: EdgeInsets.symmetric(horizontal: 20.sp),
            padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 20.sp),
            child: Row(
              children: [
                Image.asset(
                  iconsUI.en,
                  height: 25.sp,
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                    child: CustomText(
                        title: 'english'.tr(),
                        fontSize: 15,
                        color: colorsUI.black,
                        align: TextAlign.start,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  width: 10.sp,
                ),
                Icon(
                  PhosphorIconsFill.checkCircle,
                  size: 20.sp,
                  color: globalFunctions.getLanguage(context) == 'EN'
                      ? colorsUI.success500
                      : colorsUI.black,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 40.sp,
        ),
      ],
    );
  }
}
