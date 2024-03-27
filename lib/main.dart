import 'package:flutter/material.dart';
import 'package:flutter_theme/provider/theme_provider.dart';
import 'package:flutter_theme/screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: Colors.black54,
              brightness: Brightness.light
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark
              
            ),
            themeMode: themeProvider.currentThemeMode == ThemeModeType.System
                ? ThemeMode.system
                : themeProvider.currentThemeMode == ThemeModeType.Dark
                    ? ThemeMode.dark
                    : ThemeMode.light,
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}
