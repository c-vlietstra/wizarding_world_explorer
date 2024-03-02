import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/screens/main_screen.dart';
import 'package:wizarding_world_explorer/screens/setup_screen.dart';
import 'package:wizarding_world_explorer/screens/splash_screen.dart';
import 'package:wizarding_world_explorer/providers/theme_provider.dart';
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

    ref.read(themeModeProvider.notifier).loadThemeMode();
    
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ref.watch(themeModeProvider) ?? ThemeMode.system,
      routes: {
        '/' : (context) => const SplashPage(),
        '/main' : (context) => const MainPage(),
        '/setup' : (context) => const SetupPage(),
      },
    );
  }
}
