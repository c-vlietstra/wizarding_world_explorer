import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/screens/main_screen.dart';
import 'package:wizarding_world_explorer/screens/splash_screen.dart';
import 'package:wizarding_world_explorer/services/theme_service.dart';
import 'package:wizarding_world_explorer/theme/color_schemes.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final themeMode = ref.watch(themeModeProvider);
    
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: themeMode,
      routes: {
        '/' : (context) => const SplashPage(),
        '/main' : (context) => const MainPage(),
      },
    );
  }
}
