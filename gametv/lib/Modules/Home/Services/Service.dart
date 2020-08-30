import 'package:gametv/Modules/Home/Models/TournamentsResponse.dart';
import 'package:gametv/Modules/Utils/Constants.dart';
import 'package:gametv/Services/ApiProvider.dart';

class Service {
  static Future<Data> getTournaments({String cursor}) async {
    String url = TOURNAMENTS_LIST;
    if (cursor != null) {
      url = url + "&cursor=$cursor";
    }
    try {
      final response = await ApiProvider.get(url);
      final tournaments = TournamentResponse.fromJson(response);
      if (tournaments.success) {
        return tournaments.data;
      } else {
        return throw Exception(SOMETHING_WENT_WRONG);
      }
    } catch (error) {
      return throw Exception(error);
    }
  }
}
