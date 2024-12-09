import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_search_app/data/model/location.dart';
import 'package:local_search_app/data/repository/location_repository.dart';
import 'package:local_search_app/data/repository/vworld_repository.dart';

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

  Future<void> searchByGps(double lat, double lng) async {
    final vworldRepo = VworldRepository();
    final addressList = await vworldRepo.findByLatLng(lat, lng);

    // print(address);
    String address = addressList.first;
    String query = address.split(' ').sublist(0, 2).join(' ');

    searchLocations(query);
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
