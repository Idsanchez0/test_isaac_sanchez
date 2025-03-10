import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final double? height;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;

  const CustomText({
    super.key,
    required this.title,
    required this.fontSize,
    required this.color,
    required this.align,
    required this.fontWeight,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.tr(),
      textAlign: align,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
          height: height ?? 1.5),
    );
  }
}
