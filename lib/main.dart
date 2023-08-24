import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:psgfanboy/providers/theme_provider.dart';
import 'package:psgfanboy/screens/homepage.dart';
import 'consts/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider.notifier).mode;
    return MaterialApp(
      title: 'p1 Flutter AI',
      theme: FlutterTheme.lightModeAppTheme,
      darkTheme: FlutterTheme.darkModeAppTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
