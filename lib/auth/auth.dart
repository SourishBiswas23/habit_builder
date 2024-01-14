import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  Auth._();
  static final Auth _instance = Auth._();
  factory Auth() => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<bool> isSignedIn() async {
    return _auth.currentUser != null ? true : false;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> signInWithEmailAndPassword({
    required String emailId,
    required String password,
  }) async {
    await _auth.signInWithEmailAndPassword(
      email: emailId,
      password: password,
    );
  }

  Future<void> registerWithEmailAndPassword({
    required String emailId,
    required String password,
  }) async {
    await _auth.createUserWithEmailAndPassword(
      email: emailId,
      password: password,
    );
  }

  Future<void> sendPasswordResetEmail({required String emailId}) async {
    await _auth.sendPasswordResetEmail(email: emailId);
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
