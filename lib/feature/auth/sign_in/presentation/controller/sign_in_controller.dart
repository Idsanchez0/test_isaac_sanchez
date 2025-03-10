import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_isaac_sanchez/core/services/global_functions.dart';

import '../../data/sign_in_repository.dart';
import '../state/sign_in_state.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController({required this.signInRepository}) : super(SignInState());
  final SignInRepository signInRepository;

  Future<bool> loginBiometric() async {
    bool login = await globalFunctions.authenticateBiometric();
    return login;
  }
}

final signInController =
    StateNotifierProvider<SignInController, SignInState>((ref) {
  return SignInController(
      signInRepository: ref.watch(signInRepositoryProvider));
});
