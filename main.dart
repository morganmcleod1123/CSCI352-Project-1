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
        title: !isSearching ? Text(widget.title): TextField(decoration: InputDecoration(hintText: "Search for Recycling Plants"),),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
            onPressed: (){
                setState(() {
                  this.isSearching = !this.isSearching;
                });
            },
          ),
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
