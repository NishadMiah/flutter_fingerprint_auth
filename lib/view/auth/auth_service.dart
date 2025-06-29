import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class AuthService {
  //======= initialize local auth ==========
  final LocalAuthentication auth = LocalAuthentication();

  /// Authenticate using biometric (fingerprint, face, etc).

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
        /// If the device does not have biometric capabilities, this will return false.
        isAuthenticated = false;

        print('No biometrics, $e');
      } else if (e.code == auth_error.notEnrolled) {
        /// If the user has not enrolled in biometric authentication, this will return false.
        isAuthenticated = false;

        print('No biometrics2, $e');
      } else {
        /// If the user cancels the authentication, this will return false.
        isAuthenticated = false;

        
        print('No biometrics2, $e');
      }
    } catch (e) {
      /// If the authentication fails, this will return false.
      isAuthenticated = false;
      debugPrint(e.toString());
    }
    return isAuthenticated;
  }
}
