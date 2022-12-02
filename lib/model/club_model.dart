class ClubModel {
  ClubModel({
    required this.teams,
  });

  List<Team> teams;

  factory ClubModel.fromJson(Map<String, dynamic> json) => ClubModel(
        teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
      };
}

class Team {
  Team({
    this.idTeam,
    this.strTeam,
    this.strLeague,
    this.intFormedYear,
    this.strCountry,
    this.strTeamJersey,
    this.strDescriptionEN,
    this.strStadium,
    this.strStadiumThumb,
    this.strTeamBadge,
    this.strTeamBanner,
    this.strTeamFanart1,
  });

  String? idTeam;
  String? strTeam;
  String? strLeague;
  String? strCountry;
  String? intFormedYear;
  String? strStadium;
  String? strStadiumThumb;
  String? strDescriptionEN;
  String? strTeamBanner;
  String? strTeamBadge;
  String? strTeamJersey;
  String? strTeamFanart1;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        idTeam: json["idTeam"],
        strTeam: json["strTeam"],
        strLeague: json["strLeague"],
        strCountry: json["strCountry"],
        intFormedYear: json["intFormedYear"],
        strStadium: json["strStadium"],
        strStadiumThumb: json["strStadiumThumb"],
        strTeamBanner: json["strTeamBanner"],
        strTeamBadge: json["strTeamBadge"],
        strTeamJersey: json["strTeamJersey"],
        strTeamFanart1: json["strTeamFanart1"],
        strDescriptionEN: json["strDescriptionEN"],
      );

  Map<String, dynamic> toJson() => {
        "idTeam": idTeam,
        "strTeam": strTeam,
        "strLeague": strLeague,
        "strCountry": strCountry,
        "intFormedYear": intFormedYear,
        "strStadium": strStadium,
        "strTeamBanner": strTeamBanner,
        "strTeamBadge": strTeamBadge,
        "strTeamJersey": strTeamJersey,
        "strTeamFanart1": strTeamFanart1,
        "strDescriptionEN": strDescriptionEN,
      };
}
