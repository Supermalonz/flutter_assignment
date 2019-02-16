import 'package:flutter/material.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegisterPage();
  }
}

class RegisterPage extends State<Register>{
  String id;
  String pass;
  String pass2;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title : Text("REGISTER", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: new Container(
        padding:EdgeInsets.all(30),
        child:Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration : InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: 'Email'
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  id = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onSaved: (value) {
                  pass = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Confirm Password",
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onSaved: (value) {
                  pass2 = value;
                },
              ),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text("CONTINUE"),
                  onPressed: () {
                          _formKey.currentState.save();
                          if (id == '' || pass == '' || pass2 == '') {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('กรุณาระบุข้อมูลให้ครบถ้วน'), backgroundColor: Colors.blue));
                          }
                          if (id == 'admin') {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('user นี้มีอยู่ในระบบแล้ว'),backgroundColor: Colors.blue));
                          }
                          if (id != '' && id != 'admin' && pass != '' && pass2 != '') {
                            Navigator.pushNamed(context, '/Login');
                          }
                        },
                )
            ],
          ),
        ),
      ),
    );
  }
}