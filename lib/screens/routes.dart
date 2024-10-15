import 'package:biomark/screens/account_recovery/account_recovery_screen.dart';
import 'package:biomark/screens/login_registration/login_fail_screen.dart';
import 'package:biomark/screens/login_registration/login_screen.dart';
import 'package:biomark/screens/login_registration/registration_screen.dart';
import 'package:biomark/screens/password_change/forgot_password_screen.dart';
import 'package:biomark/screens/profile_and_pac/pac_creation_screen.dart';
import 'package:biomark/screens/profile_and_pac/pac_screen.dart';
import 'package:biomark/screens/profile_and_pac/profile_screen.dart';
import 'package:flutter/material.dart';

class RouteHandler extends StatelessWidget {
  const RouteHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        // if (settings.arguments is List) {
        //   print("Arguments is a list");
        // } else {
        //   print("Arguments is not a list");
        // }
        switch (settings.name) {
          case "/login":
            return MaterialPageRoute(
              builder: (context) => LoginScreen(),
            );
          case "/loginfailscreen":
            return MaterialPageRoute(
              builder: (context) => LoginFailScreen(),
            );
          case "/registrationscreen":
            return MaterialPageRoute(
              builder: (context) => RegistrationScreen(),
            );
          case "/forgotpasswordscreen":
            return MaterialPageRoute(
              builder: (context) => ForgotPassWordScreen(),
            );
          case "/recoveraccscreen":
            return MaterialPageRoute(
              builder: (context) => AccountRecoveryScreen(),
            );
          case "/normalprofilescreen":
            return MaterialPageRoute(
              builder: (context) => NormalProfileScreen(),
            );
          case "/paccreatingscreen":
            return MaterialPageRoute(
              builder: (context) => PACCreatingScreen(),
            );
          case "/pacscreen":
            return MaterialPageRoute(
              builder: (context) => PACScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => LoginScreen(),
            );
        }
      },
    );
  }
}
