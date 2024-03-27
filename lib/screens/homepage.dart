import 'package:flutter/material.dart';
import 'package:flutter_theme/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile<ThemeModeType>(
              title: const Text('Light Theme'),
              value: ThemeModeType.Light,
              groupValue: themeProvider.currentThemeMode,
              onChanged: (value) => themeProvider.setThemeMode(value!),
            ),
            RadioListTile<ThemeModeType>(
              title: const Text('Dark Theme'),
              value: ThemeModeType.Dark,
              groupValue: themeProvider.currentThemeMode,
              onChanged: (value) => themeProvider.setThemeMode(value!),
            ),
            RadioListTile<ThemeModeType>(
              title: const Text('System Theme'),
              value: ThemeModeType.System,
              groupValue: themeProvider.currentThemeMode,
              onChanged: (value) => themeProvider.setThemeMode(value!),
            ),
          ],
        ),
      ),
    );
  }
}
