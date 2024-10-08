class ViewSettings {
  final bool compactMode;
  final bool darkMode;
  // Whether to only show the do date if it's set and the due date is not set
  final bool showDoDateOverDueDate;

  ViewSettings({
    this.compactMode = false,
    this.darkMode = false,
    this.showDoDateOverDueDate = true,
  });

  ViewSettings copyWith(
      {bool? compactMode, bool? darkMode, bool? showDoDateOverDueDate}) {
    return ViewSettings(
      compactMode: compactMode ?? this.compactMode,
      darkMode: darkMode ?? this.darkMode,
      showDoDateOverDueDate:
          showDoDateOverDueDate ?? this.showDoDateOverDueDate,
    );
  }
}
