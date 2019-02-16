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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding:EdgeInsets.all(25),
        child:Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Image.asset(
                "Images/eagle.png", 
                height: 100,
                width: 100,
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  // labelText: "Email",
                  hintText: "User Id",
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => print(value),
                validator: (value){
                  if (value.isEmpty) {
                    return "กรุณาระบุ user or password";
                  }
                  if (value != 'admin')
                    return 'user or password ไม่ถูกต้อง';
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
                onSaved: (value) => print(value),
                validator: (value){
                  if (value.isEmpty) {
                    return "กรุณาระบุ user or password";
                  }
                  if (value != 'admin') 
                    return 'user or password ไม่ถูกต้อง';
                },
              ),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text("Login"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
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