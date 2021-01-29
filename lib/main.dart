import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:page_transition/page_transition.dart';

import 'styles/styles.dart';
import 'routes/routes.dart';
import 'data_models/games_data.dart';
import 'data_models/matches_data.dart';
//import 'views/games_view.dart';
//import 'views/matches_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void _setGames() {
    games.add(Game('Football'));
    games.add(Game('Hockey'));
    games.add(Game('Volleyball'));
    games.add(Game('Tennis'));
    games.add(Game('Basketball'));
  }

  void _setMatches() {
    matches.add(Match(
        'Zenith', 'Arsenal', Game('Football'), 1, 3, '14:00', '1h 50min'));
    matches.add(Match('Arizona Cardinals', 'Cincinnati Bengals',
        Game('Football'), 2, 0, '11:00', '1h 50min'));
    matches.add(Match('Dallas Cowboys', 'Los Angeles Rams', Game('Football'), 1,
        1, '10:00', '1h 50min'));
    matches.add(Match('New York Giants', 'Minnesota Vikings', Game('Football'),
        1, 4, '12:00', '1h 50min'));
    matches.add(Match('New England Patriots', 'Tampa Bay Buccaneers',
        Game('Football'), 7, 1, '12:30', '1h 50min'));
    matches.add(Match('Seattle Seahawks', 'Indianapolis Colts',
        Game('Football'), 0, 0, '14:10', '1h 50min'));
    matches.add(Match('Detroit Lions', 'Kansas City Chiefs', Game('Football'),
        0, 1, '13:30', '1h 50min'));
    matches.add(Match('Carolina Panthers', 'Baltimore Ravens', Game('Football'),
        1, 0, '14:00', '1h 50min'));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    games.clear();
    matches.clear();
    _setGames();
    _setMatches();
    return MaterialApp(
      routes: appRoute,
      initialRoute: '/games_list',
      //home: GamesListView(),
      theme: kTheme,
      debugShowCheckedModeBanner: false,
      /*
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/games_list':
            return PageTransition(
                child: GamesListView(), type: PageTransitionType.scale);
            break;
          case '/matches_list':
            return PageTransition(
                child: MatchesListView(),
                type: PageTransitionType.scale,
                alignment: Alignment.center);
            break;
          default:
            return null;
        }
      },
      */
    );
  }
}
