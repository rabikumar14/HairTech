import 'package:Beautech/extra/auth_wrappers.dart';
import 'package:Beautech/models/user.dart';
import 'package:Beautech/services/crud_model.dart';
import 'package:Beautech/services/payment_services/locator.dart';
import 'package:Beautech/services/payment_services/network_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EmailSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool _isSigningIn;

  EmailSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future loginWithEmail(String email, String password) async {
    isSigningIn = true;
    final user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (user == null) {
     
      isSigningIn = false;
      return;
    } else {
        isSigningIn = false;

    }
  }

  Future login() async {
    isSigningIn = true;

    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (authResult.additionalUserInfo.isNewUser) {
        var newAppUser = AppUser(
          appUserID: authResult.user.uid,
          appUserEmail: authResult.user.email,
          appUserName: authResult.user.displayName,
          appUserProfilePic: authResult.user.photoURL,
          userCreatedAt: DateTime.now(),
          lastLogin: DateTime.now(),
          appUserAddress: "",
          isSeller: false,
          isDev: false,
        );

        await CRUD()
            .addNewUser(authResult.user.uid, newAppUser)
            .then((value) async {
          final NetworkService networkService = locator.get();
          networkService.updateUser(authResult.user);
        });
      }

      await FirebaseAuth.instance.signInWithCredential(credential);

      isSigningIn = false;
    }
  }

  void logout(BuildContext context) async {
   
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
  // the new route
  MaterialPageRoute(
    builder: (BuildContext context) => AuthWrapper(),
  ),

  // this function should return true when we're done removing routes
  // but because we want to remove all other screens, we make it
  // always return false
  (Route route) => false,
);

  }
}
