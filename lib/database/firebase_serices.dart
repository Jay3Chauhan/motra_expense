import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await userCredential.user!.sendEmailVerification();
      }

      return userCredential.user;
    } catch (error) {
      SnackBar(content: Text('Error signing up with email: $error'));
      print('Error signing up with email: $error');
      return null;
    }
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await userCredential.user!.sendEmailVerification();
      }

      return userCredential.user;
    } catch (error) {
      print('Error signing in with email: $error');
      return null;
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return userCredential.user;
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (error) {
      print('Error signing out: $error');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (error) {
      print('Error sending password reset email: $error');
    }
  }

  Future<void> storeUserData(User user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'email': user.email,
        // Add other user details as required
      });
    } catch (error) {
      print('Error storing user data: $error');
    }
  }
}
