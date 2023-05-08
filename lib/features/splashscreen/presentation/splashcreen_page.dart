import 'dart:async';

import 'package:coffeetruck1/features/home/presentation/widgets/homewidgets.dart';
import 'package:coffeetruck1/features/registration/presentation/registrationpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isTrue = true;
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>isTrue ? Registration():HomeWidget())));
  }

  Future init() async {
    var pref = await SharedPreferences.getInstance();
    return pref.setBool("activ", isTrue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(child: Image.asset("assets/truck.jpg")),
    );
  }
}
