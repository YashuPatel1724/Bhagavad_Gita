import 'package:bhagwad_gita/BhagwadGita/provider/gita_provider.dart';
import 'package:bhagwad_gita/BhagwadGita/view/Screen/home_page.dart';
import 'package:bhagwad_gita/BhagwadGita/view/Screen/splash_screen.dart';
import 'package:bhagwad_gita/BhagwadGita/view/Screen/verse_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GitaProvider(),
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/' : (context) => SplashScreen(),
          '/home' : (context) => HomePage(),
          '/detail' : (context) => DetailPage(),
        },
      ),
    );
  }
}
