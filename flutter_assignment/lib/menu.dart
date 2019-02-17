import 'package:flutter/material.dart';

class Menu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MenuHome();
  }
}

class MenuHome extends State<Menu>{
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 5,
        child: new Scaffold(
          backgroundColor: Colors.blue,
          appBar: new AppBar(
            title: Text('Home'),
            centerTitle: true,
          ),

          bottomNavigationBar: new TabBar(
            labelColor: Colors.white,
            tabs: <Widget>[
              new Tab(icon: Icon(Icons.view_compact)),
              new Tab(icon: Icon(Icons.notifications)),
              new Tab(icon: Icon(Icons.explore)),
              new Tab(icon: Icon(Icons.person)),
              new Tab(icon: Icon(Icons.settings))
            ],
          ),
          
          body: new TabBarView(
          children: [
            new Container(child: Center(child: Text('Home', 
            style: TextStyle(fontSize: 42, color: Colors.grey),)), color: Colors.white,),
            new Container(child: Center(child: Text('Notify', 
            style: TextStyle(fontSize: 42, color: Colors.grey))), color: Colors.white,),
            new Container(child: Center(child: Text('Map', 
            style: TextStyle(fontSize: 42, color: Colors.grey))), color: Colors.white,),
            new Container(child: Center(child: Text('Profile', 
            style: TextStyle(fontSize: 42, color: Colors.grey))), color: Colors.white,),
            new Container(child: Center(child: Text('Setup', 
            style: TextStyle(fontSize: 42, color: Colors.grey))), color: Colors.white,)
          ],
        ),
        )
    );
  }
}