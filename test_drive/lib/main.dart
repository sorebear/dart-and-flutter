import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './second-screen.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MaterialApp(
    title: 'Flutter Test Drive',
    home: HomeScreen(),
  ));
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: _isFavorited ? Icon(Icons.star) : Icon(Icons.star_border),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Waianapanapa Black Sand Beach',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  )
                ),
                Text(
                  'Maui, Hawaii',
                  style: TextStyle(
                    color: Colors.grey[500],
                  )
                )
              ]
            )
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ]
      )
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(32.0),
      child: Text(
        'Remote, wild, low-cliffed volcanic coastline offering solitude and respite from urban life. Lodging, camping, picnicking, shore fishing and hardy family hiking along an ancient Hawaiian coastal trail which leads to Hana. Excellent opportunity to view a seabird colony and anchialine pools. Other features include native hala forest, legendary cave, heiau (religious temple), natural stone arch, sea stacks, blow holes and small black sand beach. (122.1 acres)',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome Beaches'),
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/coast.jpg',
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen())
              );
            },
            child: Text('Go To Next Page'),
          )
        ]
      )
    );
  }
}