import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insta/pages/login_screen.dart';
import 'package:insta/pages/signup_screen.dart';
import 'package:insta/responsive/mobile_screen_layout.dart';
import 'package:insta/responsive/responsive_layout_screen.dart';
import 'package:insta/responsive/web_screen_layout.dart';
import 'package:insta/utils/colors.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  // initializng UI or Widgets on screen, with parallel to it is being connecting to firebase
  WidgetsFlutterBinding.ensureInitialized();

// linking to firebase on start of app
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyC02zcw80LycoHl15mUBb_SXgF6R-7rSFo',
        appId: "1:722414755437:web:8c24a73b66e2f98ed46964",
        messagingSenderId: "722414755437",
        projectId: "instagram-e3404",
        storageBucket: "instagram-e3404.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // themeing the app
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      title: "Instagram",
      home: const SignupScreen(),

      // const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
    );
  }
}
