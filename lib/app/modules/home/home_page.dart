import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpokedex/app/modules/arroz/arroz_page.dart';
import 'package:flutterpokedex/app/modules/pokemonList/pokemonList_page.dart';
import 'package:flutterpokedex/app/modules/whoisthat/whoisthat_page.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/pokemonDetails_page.dart';
import 'package:flutterpokedex/app/modules/whoisthatoutsmarter/whoisthatoutsmarter_page.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => ArrozPage()));
            },
            child: Text("Cachorro"),
          ),
          FlatButton(
            color: Colors.brown,
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => PokemonDetailsPage()));
            },
            child: Text("Gato"),
          ),
          FlatButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => PokemonListPage()));
            },
            child: Text(
              "Corote",
              style: TextStyle(color: Colors.white),
            ),
          ),
          FlatButton(
            color: Colors.yellow,
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => WhoisthatoutsmarterPage()));
            },
            child: Text("Feijao"),
          ),
        ],
      ),
    );
  }
}
