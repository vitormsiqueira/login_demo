import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum FormType{
  login,
  register,
}

class _LoginPageState extends State<LoginPage> {

  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave(){
    final form = formKey.currentState;
    if (form.validate()){
      form.save(); // aqui salvamos os valores que recebemos no form
      print("Form is valid. Email: $_email, password: $_password");
      return true;
    } else {
      print("Form is invalid. Email: $_email, password: 9$_password");
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()){
      try {
        if (_formType == FormType.login){
          FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
          print('Sign in: ${user.uid}');     
        } else {
          FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)).user;
          print('Registered user: ${user.uid}');
        }
      } catch (e) {
        print('error: $e');
      }

    }
  }

  void moveToRegister(){
    formKey.currentState.reset(); // this function reset the values in textfilds
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin(){
    formKey.currentState.reset(); // this function reset the values in textfilds
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Login Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs() + buildSubmitButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs(){
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
        obscureText: true,
      ),
    ];
  }

  List<Widget> buildSubmitButtons(){
    if (_formType == FormType.login){
      return [
        RaisedButton( 
          child: Text(
            "Login", 
            style: 
            TextStyle(
              fontSize: 20.0
            ),
          ),
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child: Text("Create an account", 
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return [
        TextFormField(
          decoration: InputDecoration(labelText: 'Name'),
        ),
        RaisedButton( 
          child: Text(
            "Create an account", 
            style: 
            TextStyle(
              fontSize: 20.0
            ),
          ),
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child: Text("Have an account? Login", 
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
          onPressed: moveToLogin,
        ),
      ];
    }
  }

}