import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'supplemental/cut_corners_border.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      theme: _buildShrineTheme(),
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => const HomePage(),
      },
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaleFactor: 1.0,
          ),
          child: child!,
        );
      },
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();

  final Color primary = Colors.pink.shade100;
  final Color onPrimary = Colors.white;
  final Color secondary = Colors.brown.shade900;
  final Color onSecondary = Colors.white;
  final Color surface = Colors.white;
  final Color background = Colors.grey.shade50;

  final ColorScheme colorScheme = base.colorScheme.copyWith(
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    surface: surface,
    background: background,
  );

  final TextTheme shrineTextTheme = _buildShrineTextTheme(base.textTheme);

  return base.copyWith(
    colorScheme: colorScheme,
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 2.0,
      centerTitle: true,
    ),
    textTheme: shrineTextTheme,
    cardTheme: CardThemeData(
      elevation: 2.0,
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      border: CutCornersBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(color: colorScheme.primary),
      ),
      labelStyle: TextStyle(color: Colors.grey.shade800),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.secondary,
      foregroundColor: colorScheme.onSecondary,
      elevation: 4.0,
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        displaySmall: base.displaySmall?.copyWith(fontWeight: FontWeight.w600),
        titleLarge: base.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        bodyLarge: base.bodyLarge?.copyWith(fontSize: 14.0),
        bodyMedium: base.bodyMedium?.copyWith(fontSize: 12.0),
      )
      .apply(
        fontFamily: 'Rubik',
      );
}
