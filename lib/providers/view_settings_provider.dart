import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/schemas/view_settings.dart';

final viewSettingsProvider =
    StateNotifierProvider<ViewSettingsNotifier, ViewSettings>(
  (ref) => ViewSettingsNotifier(),
);

class ViewSettingsNotifier extends StateNotifier<ViewSettings> {
  ViewSettingsNotifier() : super(ViewSettings());
  toggleCompactMode() {
    state = state.copyWith(compactMode: !state.compactMode);
  }
}

final compactModeProvider = StateNotifierProvider<CompactModeNotifier, bool>(
  (ref) => CompactModeNotifier(),
);

class CompactModeNotifier extends StateNotifier<bool> {
  CompactModeNotifier() : super(false);
  toggle() {
    state = !state;
  }
}
