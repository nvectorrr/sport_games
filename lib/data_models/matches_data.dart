import 'games_data.dart';

class Match {
  String firstTeam;
  String secondTeam;
  Game game;
  int firstTeamScore;
  int secondTeamScore;
  String startTime;
  String onGoingTime;

  Match(
    this.firstTeam,
    this.secondTeam,
    this.game,
    this.firstTeamScore,
    this.secondTeamScore,
    this.startTime,
    this.onGoingTime,
  );
}

List<Match> matches = List();
