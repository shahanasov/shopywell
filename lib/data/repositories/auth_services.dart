import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shopywell/screens/home/root_screen.dart';
import 'package:shopywell/screens/onboarding/get_started_screen.dart';

final signUpProvider = Provider((ref) => SignUpServices(ref));

class SignUpServices {
  final Ref ref;

  SignUpServices(this.ref);

  Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created successfully')),
      );

      Navigator.pop(context); // go back to login
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred';

      if (e.code == 'email-already-in-use') {
        message = 'Email is already in use';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email address';
      } else if (e.code == 'weak-password') {
        message = 'Password is too weak';
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  // forgot password
    Future<void> forgotPassword({
    required BuildContext context,
    required String email,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset link sent! Check your email.'),
        ),
      );

      Navigator.pop(context); // Optionally go back to login screen
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found with this email';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Invalid email address';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong: $e')),
      );
    }
  }


  // google sign in

  Future<void> signInWithGoogle(BuildContext context) async {
    final googleSignIn = GoogleSignIn.instance;

    try {
      // 🔧 Initialize Google Sign-In
      await googleSignIn.initialize();

      // ✋ Start interactive Google sign-in
      final account = await googleSignIn.authenticate(scopeHint: ['email']);

      // ✅ Retrieve tokens correctly
      final auth = account.authentication;
      final String? idToken = auth.idToken;
      // final String? accessToken = auth.accessToken;
      //  || accessToken == null
      if (idToken == null) {
        throw Exception('Missing Google Auth tokens (idToken or accessToken)');
      }

      // 🔑 Sign in to Firebase with Google credentials
      final credential = GoogleAuthProvider.credential(
        idToken: idToken,
        // accessToken: accessToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      
      // ✅ Success - navigate to home screen
      if (context.mounted) {
        // Add a small delay to ensure Firebase auth state is updated
        await Future.delayed(const Duration(milliseconds: 500));
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const GetStartedScreen()),
          (route) => false,
        );
      }
    } on GoogleSignInException catch (e) {
      final isCanceled = e.code.toString().contains('canceled');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isCanceled
                ? 'Google sign-in canceled'
                : 'GoogleSignIn error: ${e.code}',
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Sign-in failed: $e')));
    }
  }

  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final accessTokenMap = result.accessToken?.toJson();

        if (accessTokenMap == null || accessTokenMap['token'] == null) {
          throw Exception("Missing Facebook access token");
        }

        final String token = accessTokenMap['token'];

        final OAuthCredential credential = FacebookAuthProvider.credential(
          token,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);

        // ✅ Success - navigate to home screen
        if (context.mounted) {
          // Add a small delay to ensure Firebase auth state is updated
          await Future.delayed(const Duration(milliseconds: 500));
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const RootScreen()),
            (route) => false,
          );
        }
      } else if (result.status == LoginStatus.cancelled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Facebook sign-in cancelled")),
        );
      } else {
        print(result.message);
        throw Exception("Facebook sign-in failed: ${result.message}");
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Sign-in failed: $e")));
    }
  }
}
