import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/ui/utils/paths/colors/colors_ui.dart';
import '../../../../core/ui/utils/routes/routes.dart';

class SplashScreenPage extends ConsumerStatefulWidget {
  const SplashScreenPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SplashScreenPageState();
}

class _SplashScreenPageState extends ConsumerState<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      routes.signIn(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsUI.white,
      body: Center(
        child: FadeIn(
            delay: const Duration(seconds: 1),
            duration: const Duration(seconds: 2),
            child: SpinKitCircle(
              size: 120.sp,
              color: colorsUI.primary500,
            )),
      ),
    );
  }
}
