import 'dart:convert';

import 'package:get/get.dart';
import 'package:liga_app/model/league_model.dart';
import 'package:http/http.dart' as http;

class TheSportDbController extends GetxController {
  var isLoading = false.obs;
  LeagueModel leagueModel = LeagueModel(leagues: []);
  String baseUrl = 'https://www.thesportsdb.com/api/v1/json/2/all_leagues.php';

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<LeagueModel?> fetchData() async {
    print('run fetchData');

    try {
      isLoading(true);
      http.Response response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        leagueModel = LeagueModel.fromJson(result) ;
        print('succes fetching data');
        print(leagueModel);
        return leagueModel;
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('error while data is $e');
      return null;
    } finally {
      isLoading(false);
    }
  }
}
