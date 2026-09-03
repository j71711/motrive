enum LoadingState { initial, loading, success, error }

enum NetworkStatus { connected, disconnected, unknown }

enum StateLoadUser { local, remote }

enum AuthStatus { authenticated, unauthenticated, unknown }

enum ReminderUnit { day, month, year }

enum Relation {
  father('Father'),
  mother('Mother'),
  brother('Brother'),
  sister('Sister'),
  friend('Friend'),
  sibling('Sibling');
  

  final String value;

  // Constant constructor
  const Relation(this.value);
}

enum LanguagesEnum {
  ar,
  en;

  String get displayCode => name.toUpperCase();
  String get displayName {
    switch (name) {
      case 'ar':
        return "العربية";
      default:
        return "English";
    }
  }
}
