import 'package:flutter/material.dart';
import 'package:productive/core/pages/error.dart';
import 'package:productive/features/authentication/presentation/login_screen.dart';
import 'package:productive/features/authentication/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:productive/features/authentication/presentation/pages/forgot_password/new_password.dart';
import 'package:productive/features/authentication/presentation/pages/onboarding.dart';
import 'package:productive/features/home/home.dart';
import 'package:productive/features/tasks/presentation/pages/notes.dart';

import '../../features/authentication/presentation/pages/splash.dart';
import '../../features/authentication/presentation/pages/verification/verification_new_password.dart';
import '../../features/authentication/presentation/pages/verification/verification_page.dart';
import '../../features/authentication/presentation/signUp_screen.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) =>  const SplashScreen(),
        );
      case '/onboarding':
        return MaterialPageRoute(
          builder: (context) => const Onboarding(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case '/signUp': //
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case '/forgot':
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordPage(),
        );
      case '/verify':
        return MaterialPageRoute(
            builder: (context) => const VerificationPage(),
        );
      case '/newPassword':
        return MaterialPageRoute(
          builder: (context) => const NewPassword(),
        );
      case '/verifyPass':
        return MaterialPageRoute(
          builder: (context) => const VerificationPageNewPassword(),
        );
      case '/notes':
        return MaterialPageRoute(
          builder: (context) => const NotesPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        );
    }
  }
}