import 'package:flutter/material.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RegisterPage();
  }
}

class RegisterPage extends State<Register>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                validator: (value) {
                  if (value.isEmpty) {
                    return "กรุณาระบุข้อมูลให้ครบถ้วน";
                  }
                  if (value.toLowerCase() == 'admin') {
                    return 'user นี้มีอยู่ในระบบแล้ว';
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return "กรุณาระบุข้อมูลให้ครบถ้วน";
                  }
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Confirm Password",
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onSaved: (value) => print(value),
                validator: (value) {
                  if (value.isEmpty) {
                    return "กรุณาระบุข้อมูลให้ครบถ้วน";
                  }
                },
                
              ),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text("CONTINUE"),
                  onPressed: () {
                    if(_formKey.currentState.validate()){
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