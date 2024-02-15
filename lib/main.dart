import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:practice/Screen/sign_screen.dart';
import 'firebase_options.dart';
import 'package:practice/Screen/login_Screen.dart';
import 'package:practice/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: SignScreen(),
    );
  }
}
