import 'package:flutter/material.dart';
import 'package:login_demo/authentication.dart';
import 'package:login_demo/auth_provider.dart';


class HomePage extends StatelessWidget {

  final VoidCallback onSignedOut;

  HomePage({this.onSignedOut});
  
  void _signedOut(BuildContext context) async{
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signedOut(); // chamamos a função deslogar
      onSignedOut();
    } catch (e) {
      print('errooooo $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem-vindo"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => _signedOut(context), 
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