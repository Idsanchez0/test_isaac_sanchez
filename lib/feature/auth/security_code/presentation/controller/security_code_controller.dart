import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_isaac_sanchez/feature/auth/security_code/data/security_code_repository.dart';

import '../state/security_code_state.dart';

class SecurityCodeController extends StateNotifier<SecurityCodeState> {
  SecurityCodeController({required this.securityCodeRepository})
      : super(SecurityCodeState());
  final SecurityCodeRepository securityCodeRepository;

  updateCode(String value) {
    state = state.copyWith(code: value);
  }

  updateValidatorCode(String value) {
    state = state.copyWith(codeValidator: value);
  }

  updateError(bool value) {
    state = state.copyWith(error: value);
  }

  deleteCode(String value) {
    String newValue = '';
    if (value.isNotEmpty) {
      newValue = value.substring(0, value.length - 1);
    } else {
      newValue = '';
    }
    state = state.copyWith(code: newValue);
  }
}

final securityCodeController =
    StateNotifierProvider<SecurityCodeController, SecurityCodeState>((ref) {
  return SecurityCodeController(
      securityCodeRepository: ref.watch(securityCodeRepositoryProvider));
});
