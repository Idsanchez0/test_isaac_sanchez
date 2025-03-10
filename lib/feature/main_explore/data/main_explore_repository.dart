import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainExploreRepository {
  MainExploreRepository();
}

final mainExploreRepositoryProvider = Provider<MainExploreRepository>(
  (ref) => MainExploreRepository(),
);
