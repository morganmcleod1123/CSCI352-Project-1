import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool tester = false;
  @override
  Widget build(BuildContext context) {
    if (tester == false) {
      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage()
        //(title: 'Recycling Plant Locator'),
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle _ts;

  @override
  Widget build(BuildContext context) {
    _ts = Theme.of(context).textTheme.headline4;

    return Scaffold(
      appBar: AppBar(
        title: Text("Recycling Plant Locator"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search), onPressed: () {
           showSearch(context: context, delegate: DataSearch());
          }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("To search for a recycling plant based on material:\n\n"
                "Search with the material code:\n\nPL(plastic)\nCA(cardboard)\n"
                "GL(glass)\nPA(paper)\nor AL(Aluminum)\n\n"
                "Make sure to fully type the name of the plant.", style: Theme.of(context).textTheme.headline5,
            ),
            Padding(padding: EdgeInsets.all(16.0),
            ),
          ],
        ),
      ),
    );
  }
}

RaisedButton buttonMaker(){
  RaisedButton button = new RaisedButton(onPressed: null);
  return button;
}

class DataSearch extends SearchDelegate<String>{
  // https://www.youtube.com/watch?v=FPcl1tu0gDs&ab_channel=MTECHVIRAL
  final testing = [
    "PL: Conway Recycling Center",
    "CA: Conway Recycling Center",
    "GL: Conway Recycling Center",
    "PA: Conway Recycling Center",
    "AL: Conway Recycling Center",
    "AL: JSI Metal Recycling",
    "PL: Maumelle Recycling Center",
    "CA: Maumelle Recycling Center",
    "GL: Maumelle Recycling Center",
    "PA: Maumelle Recycling Center",
    "AL: Maumelle Recycling Center",
  ];

  final recentSearches = [
    "City of Conway Recycling Center",
    "JSI Metal Recycling",
    "Maumelle Recycling Center"];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return[
      IconButton(icon:Icon(Icons.clear), onPressed: (){
        query = "";
      })
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon:AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    onPressed: (){
        close(context, null);
    }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some sort of result based on the actions
    if(query.substring(4, query.length) == "Conway Recycling Center"){
      query = "City of Conway Recycling Center\n\n"
          "Address: 4550 US-64, Conway, AR 72034\n\n"
          "Hours: 7:30am - 3:30pm\n\n"
          "Plastics, cardboard, glass, paper, and aluminum are all accepted here.";
    }
    else if (query.substring(4, query.length) == "JSI Metal Recycling"){
      query = "JSI Metal Recycling\n\n"
          "Address: 1605 E. Oak St.\n\n"
          "Hours: 8:00am - 4:30pm\n\n"
          "Aluminum and other metals are able to be recycled here.";
    }
    else if(query.substring(4, query.length) == "Maumelle Recycling Center"){
      query = "Maumelle Recycling Center\n\n"
          "Address: 600 Cogdell Drive\n\n"
          "Hours: 7:00am - 4:00pm\n\n"
          "Plastics, cardboard, glass, mixed paper, and aluminum are all accepted here.";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 535.0,
              width: 400.0,
              child: Card(
                color: Colors.green,
                child: Center(
                  child: Text(query, style: Theme.of(context).textTheme.headline5),
                ),
              ),
            )
          ],
          )
        )
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentSearches:testing.where((p) => p.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context, index) => ListTile(
      onTap: (){
        showResults(context);
      },
      leading: Icon(Icons.location_city),
      title: RichText(text: TextSpan(
        text: suggestionList[index].substring(0,query.length),
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        children: [TextSpan(
          text: suggestionList[index].substring(query.length),
          style: TextStyle(color: Colors.grey)
        )]
      )),
    ),
      itemCount: suggestionList.length
    );
  }

}
