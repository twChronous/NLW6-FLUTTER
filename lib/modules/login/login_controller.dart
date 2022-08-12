// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';

class LoginController {
  final authController = AuthController();
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      authController.setUser(context, response);
    } catch (error) {
      authController.setUser(context, null);
    }
  }
}
