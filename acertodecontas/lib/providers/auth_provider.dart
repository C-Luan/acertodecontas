import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;

  AuthProvider() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners(); // Notifica a UI quando o estado do usuário muda
    });
  }

  User? get user => _user;

  bool get isAuthenticated => _user != null;

  Future<void> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("Erro no cadastro: $e");
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("Erro no login: $e");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
