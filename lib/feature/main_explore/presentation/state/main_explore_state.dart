class MainExploreState {
  final String? value;

  MainExploreState({this.value});

  MainExploreState copyWith({String? value}) {
    return MainExploreState(value: value ?? this.value);
  }
}
