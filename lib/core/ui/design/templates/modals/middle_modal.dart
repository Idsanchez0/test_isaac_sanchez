import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiddleModal {
  middleModal(context, Widget child, Color? color) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.black54,
      builder: (BuildContext context) {
        return Center(
            child: Material(
                borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                type: MaterialType.transparency,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 5.sp),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.sp),
                    decoration: BoxDecoration(
                      color: color ?? Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                    ),
                    child: child,
                  ),
                )));
      },
    );
  }
}

MiddleModal middleModals = MiddleModal();
