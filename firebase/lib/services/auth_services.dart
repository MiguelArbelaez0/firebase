import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    }
  }

  Future<void> sigInWithGoogle() async {
    //create an instance of firebase auth and google sign in
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    // triger the auhtentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    //obtain the auth details form the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    // create a new credenteials
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    //sign in the user with the credentials
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);
  }
}
