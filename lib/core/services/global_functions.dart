import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/design/templates/loader/loader.dart';
import '../ui/design/templates/modals/middle_modal.dart';

class GlobalFunctions {
  final LocalAuthentication auth = LocalAuthentication();

  /// Redirect to URL
  Future<void> launchPage({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch ${Uri.parse(url)}');
    }
  }

  ///Check Biometrics
  Future<void> checkBiometricSupport() async {
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    bool isDeviceSupported = await auth.isDeviceSupported();
    log('Puede usar biométricos: $canCheckBiometrics');
    log('El dispositivo es compatible: $isDeviceSupported');
  }

  ///Auth with Biometric
  Future<bool> authenticateBiometric() async {
    bool isAuthenticated = false;
    isAuthenticated = await auth.authenticate(
      localizedReason: 'Por favor, autentícate para continuar',
      options: const AuthenticationOptions(
          useErrorDialogs: true, stickyAuth: true, biometricOnly: true),
    );
    return isAuthenticated;
  }

  ///Change Text Code
  String changeCode(String value) {
    if (value.isEmpty) return '';
    return value.replaceAll(RegExp(r'\d'), '●');
  }

  ///Validate Code
  validateRegisterCode({required String value, required bool values}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('code', value);
    prefs.setBool('firstTime', values);
  }

  ///Get Code
  Future<String> getCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('code') ?? 'null';
  }

  Future<bool> getFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('firstTime') ?? false;
  }

  ///Loading
  loading(context) {
    middleModals.middleModal(context, const Loader(), Colors.transparent);
  }

  ///Change Language
  void changeLanguage(BuildContext context, Locale locale) {
    context.setLocale(locale);
    context.findAncestorStateOfType<State>();
  }

  ///Get Language
  String getLanguage(BuildContext context) {
    if (context.locale.toString() == 'es_ES') {
      return 'ES';
    } else {
      return 'EN';
    }
  }
}

GlobalFunctions globalFunctions = GlobalFunctions();
