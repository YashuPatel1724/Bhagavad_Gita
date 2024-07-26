import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 4),
        (){
          Navigator.of(context).pushReplacementNamed('/home');
        }
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(fit: BoxFit.cover,'assets/images/c6349862-4970-11ef-8158-0242ac11000e.jpeg')
          ),
          Center(
            child: Text('श्रीमद् भगवद्गीता',style: TextStyle(color: Colors.white,fontSize: 43),),
          )
        ],
      ),
    );
  }
}
