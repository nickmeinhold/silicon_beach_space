import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:redux/redux.dart';
import 'package:silicon_beach_space/redux/middleware.dart';
import 'package:silicon_beach_space/redux/reducers.dart';
import 'package:silicon_beach_space/services/firestore_service.dart';
import 'package:silicon_beach_space/widgets/app.dart';

import 'models/app_state.dart';
import 'services/auth_service.dart';

void main() async {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    middleware: [
      ...createMiddleware(
        AuthService(
            FirebaseAuth.instance, GoogleSignIn(scopes: <String>['email'])),
        FirestoreService(),
      ),
    ],
  );

  runApp(SpaceApp(store));
}
