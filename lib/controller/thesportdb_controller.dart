import 'dart:convert';

import 'package:get/get.dart';
import 'package:liga_app/model/league_model.dart';
import '../model/club_model.dart';
import 'package:http/http.dart' as http;

class TheSportDbController extends GetxController {
  var isLoading = false.obs;
  LeagueModel leagueModel = LeagueModel(leagues: []);
  ClubModel clubModel = ClubModel(teams: []);
  String urlAllleagues =
      'https://www.thesportsdb.com/api/v1/json/2/all_leagues.php';
  String urlAllclubs =
      'https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l';

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchData();
  // }

  Future<LeagueModel?> fetchData() async {
    print('run fetchData');
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.parse(urlAllleagues));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print(result);
        leagueModel = LeagueModel.fromJson(result);
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

  Future<ClubModel?> fetchDataClubs(String urlLeague) async {
    print('run fetchData clubs');
    try {
      isLoading(true);
      http.Response response =
          await http.get(Uri.parse('$urlAllclubs=$urlLeague'));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        clubModel = ClubModel.fromJson(result);
        print('succes fetching data club');
        print(clubModel);
        return clubModel;
      } else {
        print('error fetching data club');
      }
    } catch (e) {
      print('error while data is $e');
      return null;
    } finally {
      isLoading(false);
    }
  }
}
