import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_isaac_sanchez/feature/auth/security_code/presentation/page/security_code_page.dart';
import 'package:test_isaac_sanchez/feature/auth/sign_in/presentation/page/sign_in_page.dart';
import 'package:test_isaac_sanchez/feature/main_explore/presentation/page/main_explore_page.dart';

///Clase Routes
///Permite un mejor control de rutas con animaciones
class Routes {
  void signIn({required context}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: const SignInPage(),
            duration: const Duration(milliseconds: 200)));
  }

  void mainExplore({required context}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: const MainExplorePage(),
            duration: const Duration(milliseconds: 200)));
  }

  void securityCode({required context}) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: const SecurityCodePage(),
            duration: const Duration(milliseconds: 200)));
  }
}

Routes routes = Routes();
