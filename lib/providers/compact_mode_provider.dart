import 'package:flutter_riverpod/flutter_riverpod.dart';

final compactModeProvider = StateNotifierProvider<CompactModeNotifier, bool>(
  (ref) => CompactModeNotifier(),
);

class CompactModeNotifier extends StateNotifier<bool> {
  CompactModeNotifier() : super(false);
  toggle() {
    state = !state;
  }
}
