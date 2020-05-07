
import 'package:flutter/material.dart';
import 'package:login_demo/authentication.dart';
import 'package:login_demo/auth_provider.dart';
import 'package:login_demo/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter login demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: RootPage(),
      ),
    );
  }
}