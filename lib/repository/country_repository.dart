import '../data/network/network_api_service.dart';

class CountryRepository {
  final NetworkApiService service = NetworkApiService();

  getCountries() async {
    var res = await service.get();
    return res;
  }
}
