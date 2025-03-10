import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_isaac_sanchez/feature/main_explore/data/main_explore_repository.dart';
import 'package:test_isaac_sanchez/feature/main_explore/presentation/state/main_explore_state.dart';

class MainExploreController extends StateNotifier<MainExploreState> {
  MainExploreController({required this.mainExploreRepository})
      : super(MainExploreState());
  final MainExploreRepository mainExploreRepository;

  updateValue(String value) {
    state = state.copyWith(value: value);
  }
}

final mainExploreController =
    StateNotifierProvider<MainExploreController, MainExploreState>((ref) {
  return MainExploreController(
      mainExploreRepository: ref.watch(mainExploreRepositoryProvider));
});
