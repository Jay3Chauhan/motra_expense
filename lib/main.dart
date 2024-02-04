import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:montra_expense_tracker/utils/app_color.dart';
import 'package:montra_expense_tracker/widgets/my_widgets.dart';

import 'views/onbordingscreens/onbording_screen.dart';
import 'views/onbordingscreens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupScreen(),
    );
  }
}
