import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'drawer.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(
                "assets/images/cooking.png",
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
        title: Text(''),
        centerTitle: true,
      ),
      body: Center(
        child: Text("We are in home"),
      ),
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
        child: Text("Caesa montes astra discordia quarum foret figuras. Opifex instabilis aetas orba distinxit undae astra super frigore. Cornua dextra locis habentia iapeto. Deus neu coegit calidis in tepescunt toto cepit limitibus. Dispositam ipsa mutastis. Feras montibus peregrinum freta fronde uno satus caelumque aliud moles.\n\n"+
    "Coegit pluviaque regio liquidum nullo? Conversa gravitate dicere spectent exemit aestu umor legebantur. Eodem recessit coercuit. Convexi hanc flexi subdita alta igni. Semine habentia iussit quanto ventis vesper fuerant quanto. Fabricator gentes inposuit modo aquae sic hunc undae. Deducite flexi postquam adspirate quisquis.\n\n"+
    "Diremit arce fulminibus valles. Turba boreas nondum mundi. Corpore metusque tumescere levius eurus congestaque tenent nulli triones. Extendi austro posset: fontes habitabilis! Sive ut. Lanient astra induit fossae instabilis origine. Melior nova terrarum aetas ventis tepescunt coeptis umentia dixere! Iudicis sorbentur hanc glomeravit."),
      ),
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
        title: Text(''),
        centerTitle: true,
      ),
      body: Center(
        child: Text("We are in home"),
      ),
    );
  }
}