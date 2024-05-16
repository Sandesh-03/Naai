import 'package:flutter/material.dart';
import 'package:naai/screens/home_page.dart';
import 'package:naai/screens/liked_screen.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/anime.dart';
import 'providers/anime_provider.dart';
import 'themes/dark_theme.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AnimeAdapter());
  await Hive.openBox<Anime>('animeBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnimeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Anime Search App',
        theme: darkTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/liked': (context) => const LikedScreen(),
        },
      ),
    );
  }
}
