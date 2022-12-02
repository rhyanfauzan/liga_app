import 'dart:convert';

LeagueModel leagueModelFromJson(String str) =>
    LeagueModel.fromJson(json.decode(str));

String leagueModelToJson(LeagueModel data) => json.encode(data.toJson());

class LeagueModel {
  LeagueModel({
    required this.leagues,
  });

  List<League> leagues;

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
        leagues:
            List<League>.from(json["leagues"].map((x) => League.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "leagues": List<dynamic>.from(leagues.map((x) => x.toJson())),
      };
}

class League {
  League({
    required this.idLeague,
    required this.strLeague,
    required this.strSport,
    this.strLeagueAlternate,
  });

  String idLeague;
  String strLeague;
  String strSport;
  String? strLeagueAlternate;

  factory League.fromJson(Map<String, dynamic> json) => League(
        idLeague: json["idLeague"],
        strLeague: json["strLeague"],
        strSport: json["strSport"],
        strLeagueAlternate: json["strLeagueAlternate"] == null
            ? null
            : json["strLeagueAlternate"],
      );

  Map<String, dynamic> toJson() => {
        "idLeague": idLeague,
        "strLeague": strLeague,
        "strSport": strSport,
        "strLeagueAlternate":
            strLeagueAlternate == null ? null : strLeagueAlternate,
      };
}
