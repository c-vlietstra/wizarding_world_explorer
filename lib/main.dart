import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizarding_world_explorer/screens/main_screen.dart';
import 'package:wizarding_world_explorer/screens/setup_screen.dart';
import 'package:wizarding_world_explorer/screens/splash_screen.dart';
import 'package:wizarding_world_explorer/providers/theme_provider.dart';
import 'package:wizarding_world_explorer/theme/color_schemes.dart';

// The entry point of the application.
void main() {
  runApp(
    const ProviderScope(
      // Wrapping the app in a ProviderScope to use Riverpod for state management.
      child: MyApp(),
    ),
  );
}

// The root widget of the application.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Load the saved theme mode from persistent storage when the app starts.
    ref.read(themeModeProvider.notifier).loadThemeMode();
    
    return MaterialApp(
      // Setting the theme and dark theme for the application using Material 3 design.
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      // Setting the theme mode based on the value provided by the themeModeProvider, defaulting to system theme.
      themeMode: ref.watch(themeModeProvider) ?? ThemeMode.system,
      // Defining routes for the application's screens.
      routes: {
        '/': (context) => const SplashPage(), // The splash screen route.
        '/main': (context) => const MainPage(), // The main screen route.
        '/setup': (context) => const SetupPage(), // The setup screen route.
      },
    );
  }
}
