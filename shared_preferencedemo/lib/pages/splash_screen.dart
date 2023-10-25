import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferencedemo/pages/home_screen.dart';
import 'package:shared_preferencedemo/pages/login_screen.dart';
import 'package:shared_preferencedemo/pages/preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    sendPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('i am the splash screen')],
        ),
      )),
    );
  }

  void sendPreference() async {
    final preference = await SharedPreferences.getInstance();
    var isLogin = preference.getBool(preferenceKeys);
    if (isLogin != null) {
      if (isLogin) {
        Timer(Duration(milliseconds: 3), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      } else {
        Timer(Duration(seconds: 2), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        });
      }
    } else {
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }
}
