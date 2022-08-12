// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print

import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  Future<void> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
