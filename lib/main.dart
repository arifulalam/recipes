// @dart=2.9
//--no-sound-null-safety
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data/recipes.dart';
import 'drawer.dart';
import 'variables.dart';

void main(){
  runApp(MaterialApp(
    home: Splash(),
    debugShowCheckedModeBanner: false,
  ));
}

class Splash extends StatefulWidget{
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash>{
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home()
    ));
  }

  initScreen(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(253, 241, 219, 1),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  "assets/images/cooking.gif",
                  width: 200,
                  height: 200,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Text(
                "Awesome App",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black26,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget{
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>{
  @override
  void initState(){
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Drawer(
        child: drawer(context),
      ),
      appBar: AppBar(
        title: Text("Recipes"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index){
          return GestureDetector(
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Card(
                  elevation: 10,
                  borderOnForeground: true,
                  child: Container(
                      height: 230,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment(-.2, 0),
                            image: NetworkImage(recipes[index]['images']['others']['hostedLargeUrl']),
                            fit: BoxFit.cover
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(103, 1, 100, .6),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  recipes[index]['author']['avatar'],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              recipes[index]['title'].toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              textAlign: TextAlign.start
                                          ),
                                        )
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              recipes[index]['author']['name'].toString(),
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              textAlign: TextAlign.start
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                )
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Recipe(recipes[index])));
            },
          );
        },
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }
}

class Recipe extends StatefulWidget{
  var recipe;
  Recipe(this.recipe);
  RecipeState createState() => RecipeState();
}

class RecipeState extends State<Recipe>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: drawer(context),
      ),
      appBar: AppBar(
        title: Text(widget.recipe['title'].toString().replaceAll('-', ' ')),
        centerTitle: true,
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }
}

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Drawer(
        child: drawer(context),
      ),
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ariful Alam Tuhin", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,), textAlign: TextAlign.center,),
            Text("Ariful Alam Tuhin\n Web & App Designer & Developer\nariful-alam@hotmail.com\n01819-532885\nhttp://syncmachine.com", textAlign: TextAlign.center,),
          ],
        )
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }
}

class Help extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Drawer(
        child: drawer(context),
      ),
      appBar: AppBar(
        title: Text('Help'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text("Help", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent)),
              ),
              Text("Caesa montes astra discordia quarum foret figuras. Opifex instabilis aetas orba distinxit undae astra super frigore. Cornua dextra locis habentia iapeto. Deus neu coegit calidis in tepescunt toto cepit limitibus. Dispositam ipsa mutastis. Feras montibus peregrinum freta fronde uno satus caelumque aliud moles.\n\n"+
                  "Coegit pluviaque regio liquidum nullo? Conversa gravitate dicere spectent exemit aestu umor legebantur. Eodem recessit coercuit. Convexi hanc flexi subdita alta igni. Semine habentia iussit quanto ventis vesper fuerant quanto. Fabricator gentes inposuit modo aquae sic hunc undae. Deducite flexi postquam adspirate quisquis.\n\n"+
                  "Diremit arce fulminibus valles. Turba boreas nondum mundi. Corpore metusque tumescere levius eurus congestaque tenent nulli triones. Extendi austro posset: fontes habitabilis! Sive ut. Lanient astra induit fossae instabilis origine. Melior nova terrarum aetas ventis tepescunt coeptis umentia dixere! Iudicis sorbentur hanc glomeravit."),

            ]
        ),
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }
}