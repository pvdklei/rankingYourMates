import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInEmail({String email, String password}) async {
    try  {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch(e) {
      print(e.toString);
      return null;
    }
  }

  Future registerEmail({String email, String password}) async {
    try {
      AuthResult result = await  _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      return result.user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  } 
}

AuthService auth = AuthService();