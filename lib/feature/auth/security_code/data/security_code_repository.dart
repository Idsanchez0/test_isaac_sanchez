import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecurityCodeRepository {
  SecurityCodeRepository();
}

final securityCodeRepositoryProvider = Provider<SecurityCodeRepository>(
  (ref) => SecurityCodeRepository(),
);
