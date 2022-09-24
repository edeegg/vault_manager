import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/phone_auth/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    if (FirebaseAuth.instance.currentUser != null) {
      print('true');
      return true;
    } else {
      print('false');
      return false;
    }
  }
}
