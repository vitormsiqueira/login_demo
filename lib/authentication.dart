// Esse arquivo é responsável por criar um "portal" para gerenciar autenticações e criação de novos usuários

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

// Abstract class its way to create a interface to implement the class auth
abstract class BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();

}

// Generic autorization component
class Auth implements BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password) async{
    FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(String email, String password) async{
    FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
    return user.uid;
  }

  Future<String> currentUser() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

}