import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Recycling Plant Locator'),
    );
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
  bool isSearching = false;



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
            RaisedButton(
              onPressed: () {},
              child: Text("Recycling Plant 1", style: _ts)
            ),
            Padding(padding: EdgeInsets.all(16.0),
            ),
            RaisedButton(
                onPressed: () {},
                child: Text("Recycling Plant 2", style: _ts)
            ),
            Padding(padding: EdgeInsets.all(16.0),
            ),
            RaisedButton(
                onPressed: () {},
                child: Text("Recycling Plant 3", style: _ts)
            ),
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String>{
  final testing = [
    "City of Conway Recycling Center",
    "JSI Metal Recycling",
    "ecoATM"
  ];

  final recentSearches = [
    "City of Conway Recycling Center",
    "JSI Metal Recycling",
    "ecoATM"];

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
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some sort of result based on the actions
    return Container(
      height: 100.0,
      width: 100.0,
      child: Card(
        color: Colors.green,
        child: Center(
          child: Text(query),
        ),
      ),
    );
    throw UnimplementedError();
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
    throw UnimplementedError();
  }

}
