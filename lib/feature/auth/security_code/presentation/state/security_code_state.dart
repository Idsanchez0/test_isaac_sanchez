class SecurityCodeState {
  final String? code;
  final String? codeValidator;
  final bool? error;

  SecurityCodeState({this.code, this.error, this.codeValidator});

  SecurityCodeState copyWith(
      {String? code, String? codeValidator, bool? error}) {
    return SecurityCodeState(
        code: code ?? this.code,
        error: error ?? this.error,
        codeValidator: codeValidator ?? this.codeValidator);
  }
}
