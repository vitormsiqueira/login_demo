import 'package:flutter/material.dart';
import 'login_page.dart';
import 'authentication.dart';
import 'login_page.dart';
import 'login_page.dart';

class RootPage extends StatefulWidget {
  final BaseAuth auth;
  RootPage({this.auth});
  
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus{
  notSignedIn,
  signdIn
}

class _RootPageState extends State<RootPage> {

  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.auth.currentUser().then((userId){
      setState(() {
        // authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signdIn;
      });
    });
  }

  void _signedIn(){
    setState(() {
      authStatus = AuthStatus.signdIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return LoginPage(
        auth: widget.auth,
        onSigned: _signedIn,
      );

      case AuthStatus.signdIn:
        return Scaffold(
          appBar: AppBar(
            title: Text("Bem vindo"),
          ),
          body: Container(
            child: Text("Bem-vindo"),
            
          ),
        );
      default:
    }
    return LoginPage(auth: widget.auth);
  }
} 
  