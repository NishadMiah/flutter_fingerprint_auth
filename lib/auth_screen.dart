import 'package:flutter/material.dart';
import 'package:flutter_fingerprint/auth_service.dart';
import 'package:flutter_fingerprint/home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () async {
            bool authenticated = await AuthService().authenticate();
            if (authenticated) {
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
