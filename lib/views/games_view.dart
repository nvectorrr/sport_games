import 'package:flutter/material.dart';

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
              onTap: () => {Navigator.pushNamed(context, '/matches_list')},
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
