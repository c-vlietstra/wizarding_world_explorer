import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);
final isCollapsedProvider = StateProvider<bool>((ref) => false);