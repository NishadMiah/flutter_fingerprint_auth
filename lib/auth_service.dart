import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class AuthService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate() async {
    bool isAuthenticated = false;

    try {
      isAuthenticated = await auth.authenticate(
        localizedReason: 'Scan fingerprint to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
          sensitiveTransaction: true,
        ),
      );
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // Add handling of no hardware here.
        print('No biometrics, $e');
      } else if (e.code == auth_error.notEnrolled) {
        // ...
        print('No biometrics2, $e');
      } else {
        // ...
         print('No biometrics2, $e');
      }
    } catch (e) {
      isAuthenticated = false;
      debugPrint(e.toString());
    }
    return isAuthenticated;
  }
}
