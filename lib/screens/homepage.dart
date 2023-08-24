import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../consts/colors.dart';
import '../consts/theme.dart';
import '../providers/theme_provider.dart';


class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value: theme.mode == ThemeMode.dark,
            onChanged: (value) {
              theme.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: 'Welcome to ',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      TextSpan(
        text: 'PSG',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          foreground: Paint()
            ..shader = ColorPalette.psgGradient.createShader(
              Rect.fromLTWH(0, 0, 50, 50),
            ),
        ),
      ),
      TextSpan(
        text: ' Fanboys!',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    ],
  ),
),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'lib/assets/psg_flag.jpg',
                height: 200,
              ),
            ),
            SizedBox(height: 100),
            Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/insideApp');
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue[900],
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      child: Text('Enter App'),
    ),
    SizedBox(width: 50),
    Image.asset(
      'lib/assets/psglogo.png',
      height: 50,
    ),
  ],
)

          ],
        ),
      ),
    );
  }
}
