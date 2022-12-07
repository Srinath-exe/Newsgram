import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/constants/constants.dart';

class AuthController extends GetxController {
  // late Rx<User?> _user;
  bool isLoging = false;
  // User? get user => _user.value;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void googleLogin() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    isLoging = true;
    update();
    try {
      googleSignIn.disconnect();
    } catch (e) {}
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication? googleAuth =
            await googleSignInAccount.authentication;
        final crendentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await auth.signInWithCredential(crendentials).then((value) {
          log("Successfully logged in as ");
          var user = auth.currentUser;
          final CollectionReference _userCollection =
              FirebaseFirestore.instance.collection('users');

          if (user != null) {
            log("DATA ADDED");
            _userCollection
                .doc(
                    "${FirebaseAuth.instance.currentUser!.displayName} ${FirebaseAuth.instance.currentUser!.uid}")
                .set({
              "email": user.email,
              "name": user.displayName,
              "phone": user.phoneNumber,
              "uid": user.uid,
              "photo_url": user.photoURL
            });
          }
        });
      }
    } on FirebaseAuthException catch (e) {
      log("Google Login Failed ${e.toString()}");
    } on PlatformException catch (e) {
      log("Google Login Failed ${e.toString()}");
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}
