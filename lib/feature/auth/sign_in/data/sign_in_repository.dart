import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInRepository {
  SignInRepository();
}

final signInRepositoryProvider = Provider<SignInRepository>(
  (ref) => SignInRepository(),
);
