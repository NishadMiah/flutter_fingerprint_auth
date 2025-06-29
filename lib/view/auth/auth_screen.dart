import 'package:flutter/material.dart';
import 'package:flutter_fingerprint/view/auth/auth_service.dart';
import 'package:flutter_fingerprint/view/Home/home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () async {
            //======== Call Authentication ========== 
            bool authenticated = await AuthService().authenticate();
            if (authenticated) {
              //======== Navigate to Home Screen ==========
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
          },
          icon: Icon(Icons.fingerprint, size: 100),
        ),
      ),
    );
  }
}
