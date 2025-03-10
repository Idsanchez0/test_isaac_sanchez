import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/paths/colors/colors_ui.dart';

class ButtonCard extends StatefulWidget {
  final Widget child;
  final double? radius;
  final double? height;

  const ButtonCard({super.key, required this.child, this.radius, this.height});

  @override
  State<ButtonCard> createState() => _ButtonCard();
}

class _ButtonCard extends State<ButtonCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: colorsUI.white,
        elevation: 3.5,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colorsUI.neutral100),
          borderRadius: BorderRadius.circular(widget.radius ?? 20.sp),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: widget.height ?? 10.sp,
              horizontal: widget.height != null ? 3.sp : 10.sp),
          child: widget.child,
        ));
  }
}
