import 'package:flutter/material.dart';
import 'register.dart';
import 'menu.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginPage();
  }
}

class LoginPage extends State<Login> {
  String id;
  String pass;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new Container(
        padding:EdgeInsets.all(25),
        child:Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Image.asset(
                "resources/eagle.png", 
                height: 150,
                width: 100,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  // labelText: "Email",
                  hintText: "User Id",
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  id = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  // labelText: "Password",
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  pass = value;
                },
              ),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text("Login"),
                  onPressed: () {
                      _formKey.currentState.save();
                      if (id == '' || pass == '') {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('กรุณาระบุ user or password'), backgroundColor: Colors.blue));
                      } 
                      else if (id == 'admin' && pass == 'admin') {
                        Navigator.pushNamed(context, '/Menu');
                      } 
                      else {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('user or password ไม่ถูกต้อง'), backgroundColor: Colors.blue));
                      }
                    },
                ),
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                FlatButton(
                  child: Text("Register New Account", style: TextStyle(color: Colors.blueGrey)),
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));},
                ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}