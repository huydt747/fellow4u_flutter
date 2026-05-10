import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_1/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-End App Tests', () {
    testWidgets('Full Login Flow', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Enter credentials
      await tester.enterText(find.byKey(const ValueKey('emailField')), 'tuantran1@gmail.com');
      await tester.enterText(find.byKey(const ValueKey('passwordField')), '123');
      await tester.pumpAndSettle();

      // Tap Sign In
      await tester.tap(find.byKey(const ValueKey('signInButton')));
      
      // Wait for navigation
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Verify we are on MainScreen (signInButton should be gone)
      expect(find.byKey(const ValueKey('signInButton')), findsNothing);
    });

    testWidgets('Full Registration Flow (Step 1 to 3)', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to Sign Up
      await tester.tap(find.text("Sign Up"));
      await tester.pumpAndSettle();

      // Step 1: Basic Info
      final String testEmail = 'test_${DateTime.now().millisecondsSinceEpoch}@example.com';
      await tester.enterText(find.byKey(const ValueKey('firstNameField')), 'Auto');
      await tester.enterText(find.byKey(const ValueKey('lastNameField')), 'Test');
      await tester.enterText(find.byKey(const ValueKey('emailField')), testEmail);
      await tester.enterText(find.byKey(const ValueKey('passwordField')), 'password123');
      await tester.enterText(find.byKey(const ValueKey('confirmPasswordField')), 'password123');
      
      await tester.ensureVisible(find.byKey(const ValueKey('signUpButton')));
      await tester.tap(find.byKey(const ValueKey('signUpButton')));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Step 2: Background Info
      expect(find.textContaining('Background information'), findsWidgets); // Check if we are on Step 2
      
      await tester.enterText(find.byKey(const ValueKey('addressField')), '123 Test St');
      await tester.enterText(find.byKey(const ValueKey('cityField')), 'Test City');
      await tester.enterText(find.byKey(const ValueKey('countryField')), 'Test Country');
      await tester.enterText(find.byKey(const ValueKey('phoneField')), '123456789');
      await tester.enterText(find.byKey(const ValueKey('languagesField')), 'English, Vietnamese');
      await tester.enterText(find.byKey(const ValueKey('introField')), 'I am an automated test guide.');
      
      await tester.ensureVisible(find.byKey(const ValueKey('nextStepButton')));
      await tester.tap(find.byKey(const ValueKey('nextStepButton')));
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Step 3: Fee & Time
      expect(find.text('Set Fee'), findsOneWidget); // Check if we are on Step 3
      
      await tester.enterText(find.byKey(const ValueKey('fee1To3Field')), '20');
      await tester.enterText(find.byKey(const ValueKey('fee4To6Field')), '35');
      
      await tester.ensureVisible(find.byKey(const ValueKey('finishButton')));
      await tester.tap(find.byKey(const ValueKey('finishButton')));
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Final Check: Should be on MainScreen
      expect(find.byKey(const ValueKey('signInButton')), findsNothing);
    });
  });
}
