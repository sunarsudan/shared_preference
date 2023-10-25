import 'package:flutter/material.dart';
import 'package:shared_preferencedemo/pages/login_screen.dart';
import 'package:shared_preferencedemo/pages/preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              child: Stack(
                children: [
                  circleBox(
                    Colors.red,
                  ),
                  Positioned(left: 20, child: circleBox(Colors.green)),
                  Positioned(left: 40, child: circleBox(Colors.blue)),
                  Positioned(left: 60, child: circleBox(Colors.green)),
                  Positioned(left: 80, child: circleBox(Colors.blue)),
                ],
              ),
            ),
            Text('i am the home screen'),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () async {
                  final response = await SharedPreferences.getInstance();
                  response.setBool(preferenceKeys, false);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));

                  setState(() {});
                },
                child: Text('Logout button'))
          ],
        ),
      )),
    );
  }
}

Widget circleBox(Color color) => Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44.0), color: color),
    );
