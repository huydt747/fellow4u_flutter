import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/screens/auth/login.dart';
import 'package:flutter_application_1/core/services/api_service.dart';
import '../unit/api_service_test.mocks.dart';

void main() {
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    ApiService.client = mockClient; // Inject mock client
  });

  Widget createSignInScreen() {
    return const MaterialApp(
      home: SignInScreen(),
    );
  }

  testWidgets('SignInScreen has email, password fields and sign in button', (WidgetTester tester) async {
    await tester.pumpWidget(createSignInScreen());

    expect(find.byKey(const ValueKey('emailField')), findsOneWidget);
    expect(find.byKey(const ValueKey('passwordField')), findsOneWidget);
    expect(find.byKey(const ValueKey('signInButton')), findsOneWidget);
  });

  testWidgets('Shows error snackbar when fields are empty', (WidgetTester tester) async {
    await tester.pumpWidget(createSignInScreen());

    await tester.tap(find.byKey(const ValueKey('signInButton')));
    await tester.pump(); // Start animation

    expect(find.text('Please fill in all fields'), findsOneWidget);
  });

  testWidgets('Shows error snackbar when login fails', (WidgetTester tester) async {
    await tester.pumpWidget(createSignInScreen());

    // Mock failure
    when(mockClient.post(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response('{"message": "Invalid credentials"}', 401));

    await tester.enterText(find.byKey(const ValueKey('emailField')), 'test@user.com');
    await tester.enterText(find.byKey(const ValueKey('passwordField')), 'password');
    
    await tester.tap(find.byKey(const ValueKey('signInButton')));
    await tester.pumpAndSettle();

    expect(find.textContaining('Login failed: Exception: Invalid credentials'), findsOneWidget);
  });
}
