import 'package:flutter/material.dart';
import 'package:login_demo/authentication.dart';

class HomePage extends StatelessWidget {

  final BaseAuth auth;
  final VoidCallback onSignedOut;

  HomePage({this.auth, this.onSignedOut});
  
  void _signedOut() async{
    try {
      await auth.signedOut(); // chamamos a função deslogar
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo"),
        actions: <Widget>[
          FlatButton(
            onPressed: _signedOut, 
            child: Text(
              "Logout",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            "Welcome",
            style: TextStyle(
              fontSize: 32.0,
            ),
          ),
        ),
      ),
    );
  }
}