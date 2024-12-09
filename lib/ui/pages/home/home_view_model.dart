import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_search_app/data/model/location.dart';
import 'package:local_search_app/data/repository/location_repository.dart';

class HomeState {
  List<Location>? locations;
  HomeState({required this.locations});
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(locations: null);
  }

  // 상태 업데이트
  Future<void> searchLocations(String query) async {
    final LocationRepository locationRepository = LocationRepository();
    var result = await locationRepository.searchLocations(query);
    print('result = $result');
    state = HomeState(
      locations: result,
    );
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
