// lib/app.dart
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      // ✅ Tambahkan theme kustom
      theme: _kShrineTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/': (context) => const HomePage(),
      },
    );
  }
}

/// ✅ Theme khusus untuk Shrine
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: Colors.pink[100],
      secondary: Colors.brown[900],
      onPrimary: Colors.white,
      onSecondary: Colors.white,
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink[100],
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineSmall: base.headlineSmall?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        titleLarge: base.titleLarge?.copyWith(
          fontSize: 18.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
      );
}
