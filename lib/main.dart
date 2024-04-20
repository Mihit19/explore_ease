import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'firebase_options.dart';
Future<void> main() async {
  // Todo: Add Widgets binding
  // Todo: Init local storage
  // Todo: Await Native Splash
  // Todo: Initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Todo: Initialize authentication

  runApp(const App());
}

