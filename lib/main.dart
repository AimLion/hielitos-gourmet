import 'package:flutter/material.dart';
import 'package:hielitos_gourmet/home.dart';
import 'package:hielitos_gourmet/upgrade.dart';

void main() {
  runApp(const HielitosGourmet());
}

class HielitosGourmet extends StatelessWidget {

  const HielitosGourmet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hielitos Gourmet',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const Home(),
        '/upgrade': (context) => const Upgrade()
      },
      home: const Home(),
    );
  }
}
