import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drawer(BuildContext context) {
  List<dynamic> menu = [
    {
      'name': "Home",
      'icon': Icons.home,
      'method': Home(),
    },{
      'name': "Account",
      'icon': Icons.home,
      'method': About(),
    },{
      'name': "Posts",
      'icon': Icons.home,
      'method': Help(),
    }
  ];

  return Container(
    width: double.infinity,
    //padding: EdgeInsets.all(10),
    //margin: EdgeInsets.only(top: 60),
    child: Column(
      children: <Widget>[
        Container(
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
            color: Colors.teal,
          ),
          child: Center(
            child: ListTile(
              leading: Icon(Icons.account_circle, size: 70,),
              title: Text(
                'Ariful Alam',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'admin',
                style: TextStyle(
                  color: Colors.deepOrange
                )
              ),
            ),
          ),
        ),
        Container(
          height: 500,
          width: double.infinity,
          child: ListView.builder(
            itemCount: menu.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: Icon(menu[index]['icon']),
                title: Text(menu[index]['name']),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => menu[index]['method']));
                },
              );
            },
          )
        ),
      ],
    ),
  );
}