import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_1/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Automation Tests', () {
    testWidgets('1. Empty fields validation', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Ensure we are on the login screen
      expect(find.byKey(const ValueKey('signInButton')), findsOneWidget);

      // Tap Sign In without entering anything
      await tester.tap(find.byKey(const ValueKey('signInButton')));
      await tester.pumpAndSettle();

      // Check for snackbar message
      expect(find.text('Please fill in all fields'), findsOneWidget);

      // Wait a bit to see the result
      await Future.delayed(const Duration(seconds: 2));
    });

    testWidgets('2. Wrong auth info', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Enter wrong email and password
      await tester.enterText(
        find.byKey(const ValueKey('emailField')),
        'wrong@user.com',
      );
      await tester.enterText(
        find.byKey(const ValueKey('passwordField')),
        'wrongpassword',
      );
      await tester.pumpAndSettle();

      // Tap Sign In
      await tester.tap(find.byKey(const ValueKey('signInButton')));
      await tester.pumpAndSettle();

      // Check for failure message (Snackbar usually contains "Login failed")
      expect(find.textContaining('Login failed'), findsOneWidget);

      await Future.delayed(const Duration(seconds: 2));
    });

    testWidgets('3. Correct auth info', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // NOTE: Update these with your valid credentials
      const String validEmail = 'tuantran1@gmail.com';
      const String validPassword = '123';

      print(
        'Please ensure the backend is running and credentials are correct.',
      );

      await tester.enterText(
        find.byKey(const ValueKey('emailField')),
        validEmail,
      );
      await tester.enterText(
        find.byKey(const ValueKey('passwordField')),
        validPassword,
      );
      await tester.pumpAndSettle();

      // Tap Sign In
      await tester.tap(find.byKey(const ValueKey('signInButton')));

      // Wait for navigation to MainScreen
      // We use a longer timeout here because it involves a network call
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Check if we reached the MainScreen (e.g., look for a widget unique to MainScreen)
      // Assuming MainScreen has a unique text or structure
      // For now, we'll just check if the login button is GONE
      expect(find.byKey(const ValueKey('signInButton')), findsNothing);

      await Future.delayed(const Duration(seconds: 2));
    });
  });
}
