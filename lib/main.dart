import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:psgfanboy/providers/theme_provider.dart';
import 'package:psgfanboy/screens/introscreen.dart';

import 'consts/theme.dart';
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}


 

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider);
    return MaterialApp(
      title: 'PSG Connect',
      theme: FlutterTheme.lightModeAppTheme,
      darkTheme: FlutterTheme.darkModeAppTheme,
      themeMode: theme == FlutterTheme.darkModeAppTheme ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
      
    );
  }
}

