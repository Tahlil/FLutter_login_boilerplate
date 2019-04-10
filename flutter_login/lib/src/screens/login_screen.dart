import 'package:flutter/material.dart';
import '../miixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();
  String email = "", password = "";

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
      validator: validateEmail,
      onSaved: (String value){
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password', hintText: "min 8 characters"),
      validator: validatePassword,
      onSaved: (String value){
        password = value;
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
          print("Time to post $email and $password to my API");  
        }
        //formKey.currentState.reset();
      },
    );
  }
}
