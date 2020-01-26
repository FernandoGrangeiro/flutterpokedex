import 'package:flutter/material.dart';
import 'package:flutterpokedex/app/modules/pokemonList/components/pokemonCard_widget.dart';
import 'package:flutterpokedex/app/modules/pokemonList/model/list_model.dart';
import 'package:flutterpokedex/app/modules/pokemonList/pokemonList_bloc.dart';

class PokemonListPage extends StatefulWidget {
  final String title;
  final bool isSmartdex;
  const PokemonListPage({Key key, this.title = "PokemonList", this.isSmartdex})
      : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  List pokeList = new List();

  @override
  void initState() {
    super.initState();
    bloc.getPokemonList(widget.isSmartdex);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PokeList>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<PokeList> snapshot) {
        if (snapshot.hasData) {
          return page(getList(snapshot.data), widget.isSmartdex? 'OutsmartList': widget.title);
        }
        else {
          return page(Text("carregando..."), widget.isSmartdex? 'OutsmartList': widget.title);
        }
      },
    );
  }

  Widget page(Widget insidePage, String title) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Align(
        child: insidePage
      ),
    );
  }

  Widget getList(PokeList data) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context,index) {
        return PokemonCardWidget(
          widget.isSmartdex?
            'https://appsimples-bucket.s3.amazonaws.com/outsmart-images/' :
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/' +
                data.list[index].id.toString() + '.png',
        data.list[index].name, data.list[index].id);
      },
      itemCount: data.list.length,
      padding: new EdgeInsets.only(top: 5.0),
    );
  }
}
