import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


import '../../../utils/paths/colors/colors_ui.dart';

class BottomModalTemplate {
  topModal({
    required BuildContext context,
    required Widget child,
    required Color? color,
  }) {
    return showMaterialModalBottomSheet(
      context: context,
      backgroundColor: colorsUI.white,
      expand: false,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.sp)),
      ),
      enableDrag: true,
      builder: (context) => child,
    );
  }
}

BottomModalTemplate bottomModals = BottomModalTemplate();
