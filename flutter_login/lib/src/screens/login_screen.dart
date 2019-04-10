import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Auth'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                emailField(),
                passwordField(),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                ),
                submitButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: 'Email Address', hintText: "you@example.com"),
      validator: (String value) {
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
          return 'Please Enter Valid Email';
      },
      onSaved: (String value){
        print(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password', hintText: "min 8 characters"),
      validator: (String value) {
        if (value.length < 8) {
          return "Password must be at least 8 characters";
        }
      },
      onSaved: (String value){
        print(value);
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        "Submit",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if(formKey.currentState.validate()){
          formKey.currentState.save();    
        }
        //formKey.currentState.reset();
      },
    );
  }
}
