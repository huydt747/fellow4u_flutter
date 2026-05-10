import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/core/services/session_service.dart';

void main() {
  group('SessionService Tests', () {
    setUp(() {
      // Clear session before each test
      SessionService.logout();
    });

    test('Initial state should be logged out', () {
      expect(SessionService.isLoggedIn, false);
      expect(SessionService.currentUserId, null);
    });

    test('Login should update state', () {
      SessionService.setCurrentUserId(123);
      expect(SessionService.isLoggedIn, true);
      expect(SessionService.currentUserId, 123);
    });

    test('Logout should clear state', () {
      SessionService.setCurrentUserId(123);
      SessionService.logout();
      expect(SessionService.isLoggedIn, false);
      expect(SessionService.currentUserId, null);
    });
  });
}
