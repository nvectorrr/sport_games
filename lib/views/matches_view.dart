import 'package:flutter/material.dart';
import 'package:sport_games/data_models/matches_data.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../styles/styles.dart';
import '../data_models/matches_data.dart';
import '../data_models/games_data.dart';

class MatchesListView extends StatefulWidget {
  _MatchesListViewState createState() => _MatchesListViewState();
}

class _MatchesListViewState extends State<MatchesListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black54,
        title: Text(
          'Matches',
          style: kHeaderTextStyle,
        ),
      ),
      body: ListView(
        children: List.generate(
            matches.length, (i) => MatchesListItem(i, key: ValueKey<int>(i))),
      ),
    );
  }
}

class MatchesListItem extends StatefulWidget {
  final int index;

  MatchesListItem(this.index, {Key key}) : super(key: key);

  @override
  _MatchesListItemState createState() => _MatchesListItemState();
}

class _MatchesListItemState extends State<MatchesListItem> {
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
          constraints: BoxConstraints.expand(height: 150),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  matches[widget.index].startTime,
                  style: kStartTimeTextStyle,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 3,
                        child: AutoSizeText(
                          matches[widget.index].firstTeam,
                          style: kTeamTextStyle,
                          maxLines: 2,
                          maxFontSize: 22,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      matches[widget.index].firstTeamScore.toString(),
                      style: kScoreTextStyle,
                    ),
                    Spacer(),
                    Text(
                      ':',
                      style: kScoreTextStyle,
                    ),
                    Spacer(),
                    Text(
                      matches[widget.index].secondTeamScore.toString(),
                      style: kScoreTextStyle,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 3,
                        child: AutoSizeText(
                          matches[widget.index].secondTeam,
                          style: kTeamTextStyle,
                          maxLines: 2,
                          maxFontSize: 22,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  matches[widget.index].onGoingTime,
                  style: kOnGoingTimeTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
