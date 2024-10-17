import 'package:firebase_auth/firebase_auth.dart';

Future<void> createUserWithEmailAndPass(String userEmail, String userPassword) async {
  final UserCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: userEmail, password: userPassword);
}
