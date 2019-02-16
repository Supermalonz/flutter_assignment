import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new Scaffold(
        body: Login()
      ),
      routes: {
        '/Menu' : (context) => Menu(),
        '/Login' : (context) => Login(),
        '/Register' : (context) => Register()
      }
    );
  }
}