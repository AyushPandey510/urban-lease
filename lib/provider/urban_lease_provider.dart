import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urban_lease/constants/colors/app_colors.dart';
import 'package:urban_lease/pages/home_page.dart';
import 'package:urban_lease/pages/sign_in_page.dart';

class UrbanLeaseProvider extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Signup user.
  Future<void> signUp(String email, String password, String confirmPassword,
      BuildContext context) async {
    if (password != confirmPassword) {
      showDialogBox(
        context,
        'Wrong Password',
        'The password doesn\'t match',
      );
    } else {
      try {
        await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          showDialogBox(
            context,
            'Email Already Exists',
            'The provided email is already in use by an existing user.',
          );
        } else if (e.code == 'invalid-email') {
          showDialogBox(
            context,
            'Invalid Email',
            'The provided value for the email user property is invalid.',
          );
        } else if (e.code == 'weak-password') {
          showDialogBox(
            context,
            'Weak Password',
            'The password entered is too weak.',
          );
        }
      } catch (e) {
        showDialogBox(
          context,
          'Exception',
          e.toString(),
        );
      }
    }
    notifyListeners();
  }

  // Sign In user.
  Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialogBox(
          context,
          'User Not Found',
          'There is no existing user record corresponding to $email.',
        );
      } else if (e.code == 'invalid-email') {
        showDialogBox(
          context,
          'Invalid Email',
          'The provided value for the email user property is invalid.',
        );
      } else if (e.code == 'wrong-password') {
        showDialogBox(
          context,
          'Invalid Password',
          'The password entered is invalid.',
        );
      }
    } catch (e) {
      showDialogBox(
        context,
        'Exception',
        e.toString(),
      );
    }
    notifyListeners();
  }

  // Sign Out user
  Future<void> signOut(BuildContext context) async {
    try {
      await auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
      );
    } catch (e) {
      showDialogBox(
        context,
        'Exception',
        e.toString(),
      );
    }
    notifyListeners();
  }

  // Template Cupertino Dialog Box for prompts.
  void showDialogBox(BuildContext context, String title, String content) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.accentColor,
          ),
        ),
        content: Text(content),
        actions: [
          CupertinoButton(
            child: const Text('Try Again'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
