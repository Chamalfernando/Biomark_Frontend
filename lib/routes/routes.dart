import 'package:biomark/screens/account_recovery/account_recovery_screen.dart';
import 'package:biomark/screens/login_registration/login_fail_screen.dart';
import 'package:biomark/screens/login_registration/login_screen.dart';
import 'package:biomark/screens/login_registration/registration_screen.dart';
import 'package:biomark/screens/login_registration/securityquestions_screen.dart';
import 'package:biomark/screens/password_change/forgot_password_init_screen.dart';
import 'package:biomark/screens/password_change/forgot_password_second_screen.dart';
import 'package:biomark/screens/profile_and_pac/pac_creation_screen.dart';
import 'package:biomark/screens/profile_and_pac/pac_screen.dart';
import 'package:biomark/screens/profile_and_pac/profile_screen.dart';
import 'package:biomark/screens/splash_screen.dart';
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
          case "/":
            return MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            );
          case "/login":
            return MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            );
          case "/loginfailscreen":
            return MaterialPageRoute(
              builder: (context) => const LoginFailScreen(),
            );
          case "/registrationscreen":
            return MaterialPageRoute(
              builder: (context) => const RegistrationScreen(),
            );
          case "/securityquestscreen":
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => SecurityQuestionsScreen(
                // firstName: args['firstName'],
                // lastName: args['lastName'],
                email: args['email'],
                dob: args['dob'],
                fullName: args['fullName'],
                passWord: args['pw'],
              ),
            );
          case "/forgotpasswordscreen":
            return MaterialPageRoute(
              builder: (context) => const ForgotPassWordInitScreen(),
            );
          case "/forgotpwsecondscreen":
            return MaterialPageRoute(
              builder: (context) => const ForgotPasswordSecondScreen(),
            );
          case "/recoveraccscreen":
            return MaterialPageRoute(
              builder: (context) => const AccountRecoveryScreen(),
            );
          case "/normalprofilescreen":
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => NormalProfileScreen(),
            );
          case "/paccreatingscreen":
            return MaterialPageRoute(
              builder: (context) => const PACCreatingScreen(),
            );
          case "/pacscreen":
            return MaterialPageRoute(
              builder: (context) => const PACScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            );
        }
      },
    );
  }
}
