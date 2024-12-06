import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user_model.dart';
import 'screens/home_page_widget.dart';
import 'screens/page1_widget.dart';
import 'screens/page2_widget.dart';
import 'screens/page3_widget.dart';
import 'screens/page4_widget.dart';
import 'screens/page5_widget.dart';
import 'screens/page6_widget.dart';
import 'screens/page7_widget.dart';
import 'screens/page8_widget.dart'; // Nova página
import 'screens/page9_widget.dart';
import 'screens/page10_widget.dart';
import 'screens/user_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renova App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: const Color(0xFFFDEBD2),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePageWidget(),
        'Page1': (context) => const Page1Widget(),
        'Page2': (context) => const Page2Widget(),
        'Page3': (context) => const Page3Widget(),
        'Page4': (context) => const Page4Widget(),
        'Page5': (context) => const Page5Widget(),
        'Page6': (context) => const Page6Widget(),
        'Page7': (context) => const Page7Widget(),
        'Page8': (context) => const Page8Widget(),
        'Page9': (context) => const Page9Widget(),
        'Page10': (context) => const Page10Widget(),
        'UserScreen': (context) => const UserScreen(),

      },
    );
  }
}

