import 'package:flutter_riverpod/flutter_riverpod.dart';

// A provider for managing the selected index in the application.
// Usage:
// - Use ref.watch(selectedIndexProvider) to access the current selected index.
// - Use ref.read(selectedIndexProvider.notifier).state = newValue to update the selected index.
final selectedIndexProvider = StateProvider<int>((ref) => 0);

// A provider for managing the collapsed state of a component (e.g., navigation drawer) in the application.
// Usage:
// - Use ref.watch(isCollapsedProvider) to access the current collapsed state.
// - Use ref.read(isCollapsedProvider.notifier).state = newValue to update the collapsed state.
final isCollapsedProvider = StateProvider<bool>((ref) => true);
