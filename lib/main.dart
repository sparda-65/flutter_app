import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String _appBarTitle="Startup Name Generator";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Startup Name Generator',
        home: RandomWords(_appBarTitle),
    );
  }
}

void pageOne(BuildContext context) {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(
              'Next page',
              style: TextStyle(fontSize: 24,fontFamily: 'RobotoMono')
        ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(snackBar);
              },
            ),
            IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Next page One',
              onPressed: () {
                pageTwo(context);
              },
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'This is Page One',
            style: TextStyle(fontSize: 24,fontFamily: 'Raleway'),
          ),
        ),
      );
    },
  ));
}

void pageTwo(BuildContext context) {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text(
              'Next page',
              style: TextStyle(fontSize: 24,fontFamily: 'RobotoMono')
          ),
          actions:<Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                scaffoldKey.currentState.showSnackBar(snackBar);
              },
            ),
          ]
        ),
        body: const Center(
          child: Text(
            'This is Page Two',
            style: TextStyle(fontSize: 24,fontFamily: 'Raleway'),
          ),
        ),
      );
    },
  ));
}

class _RandomWordsState extends State<RandomWords> {
  final String _appBarTitle;

  _RandomWordsState(this._appBarTitle);

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0, fontFamily: 'IndieFlower');

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(this._appBarTitle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Next page',
            onPressed: () {
              pageOne(context);
            },
          ),
        ],
      ),

      body: _buildSuggestions(),
    );
  }
}

class RandomWords extends StatefulWidget {
  final String _appBarTitle;

  RandomWords(this._appBarTitle, { Key key }) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState(_appBarTitle);
}

