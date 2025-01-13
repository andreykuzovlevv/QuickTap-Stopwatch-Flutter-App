import 'package:flutter/material.dart';
import 'package:stopwatch/theme.dart';
import 'stopwatch/stopwatch.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stopwatch',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      home: const StopWatchScreen(),
    );
  }
}
