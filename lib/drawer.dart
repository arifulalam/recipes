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
      'name': "About",
      'icon': Icons.account_box_outlined,
      'method': About(),
    },{
      'name': "Help",
      'icon': Icons.help,
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
              leading: CircleAvatar(
                //backgroundImage: AssetImage('assets/images/avatar.png',),
                backgroundColor: Colors.transparent,
                radius: 50,
                child: Image(
                  image: AssetImage('assets/images/avatar.png',),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
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