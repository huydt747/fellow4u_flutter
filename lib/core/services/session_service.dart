class SessionService {
  static int? _currentUserId;

  static int? get currentUserId => _currentUserId;

  static void setCurrentUserId(int id) {
    _currentUserId = id;
  }

  static bool get isLoggedIn => _currentUserId != null;

  static void logout() {
    _currentUserId = null;
  }
}
