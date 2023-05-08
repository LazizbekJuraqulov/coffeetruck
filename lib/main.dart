import 'package:coffeetruck1/features/order/presentration/pages/orderpage.dart';
import 'package:flutter/material.dart';

import 'features/splashscreen/presentation/splashcreen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home:SplashScreen() ,
    );
  }
}

