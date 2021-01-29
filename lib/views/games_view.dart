import 'package:flutter/material.dart';
import 'package:sport_games/data_models/matches_data.dart';

import '../data_models/games_data.dart';
import '../styles/styles.dart';

class GamesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black54,
          title: Text(
            ' Games',
            style: kHeaderTextStyle,
          ),
        ),
        body: ListView(
          children: List.generate(
              games.length, (i) => GamesListItem(i, key: ValueKey<int>(i))),
        ));
  }
}

class GamesListItem extends StatefulWidget {
  final int index;

  GamesListItem(this.index, {Key key}) : super(key: key);

  @override
  _GamesListItemState createState() => _GamesListItemState();
}

class _GamesListItemState extends State<GamesListItem> {
  bool _animate = false;

  static bool _isStart = true;

  @override
  void initState() {
    super.initState();
    _isStart
        ? Future.delayed(Duration(milliseconds: widget.index * 100), () {
            setState(() {
              _animate = true;
              _isStart = false;
            });
          })
        : _animate = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: AnimatedPadding(
        duration: Duration(milliseconds: 1000),
        padding: _animate
            ? const EdgeInsets.all(4.0)
            : const EdgeInsets.only(top: 10),
        child: Container(
          constraints: BoxConstraints.expand(height: 100),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: InkWell(
              onTap: _setData,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Icon(defineIcon(widget.index)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        games[widget.index].name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _setHKMatches() {
    matches.add(Match('New York Islanders', 'Philadelphia Flyers',
        Game('Hockey'), 3, 3, '11:00', '41min'));
    matches.add(Match('Washington Capitals', 'New Jersey Devils',
        Game('Hockey'), 0, 0, '12:00', '12min'));
    matches.add(Match('Boston Bruins', 'Pittsburgh Penguins', Game('Hockey'), 1,
        2, '11:30', '41min'));
    matches.add(Match('Chicago Blackhawks', 'Arizona Coyotes', Game('Hockey'),
        10, 1, '11:00', '44min'));
  }

  void _setVBMatches() {
    matches.add(
        Match('Russia', 'Italy', Game('Volleyball'), 19, 17, '11:00', '41min'));
    matches.add(
        Match('Japan', 'Canada', Game('Volleyball'), 17, 17, '12:00', '12min'));
    matches
        .add(Match('Cuba', 'USA', Game('Volleyball'), 4, 3, '11:30', '41min'));
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

  void _setData() {
    if (widget.index == 1) {
      matches.clear();
      _setHKMatches();
    } else if (widget.index == 2) {
      matches.clear();
      _setVBMatches();
    } else {
      matches.clear();
      _setMatches();
    }
    Navigator.pushNamed(context, '/matches_list');
  }

  IconData defineIcon(int id) {
    if (id == 0) {
      return Icons.sports_soccer;
    } else if (id == 1) {
      return Icons.sports_hockey;
    } else if (id == 2) {
      return Icons.sports_volleyball;
    } else if (id == 3) {
      return Icons.sports_tennis;
    } else if (id == 4) {
      return Icons.sports_basketball;
    } else {
      return Icons.error;
    }
  }
}
