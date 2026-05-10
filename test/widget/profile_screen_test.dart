import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/screens/profile/profile_screen.dart';
import 'package:flutter_application_1/core/services/api_service.dart';
import '../unit/api_service_test.mocks.dart';

void main() {
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    ApiService.client = mockClient;
  });

  Widget createProfileScreen({int? userId}) {
    return MaterialApp(
      home: ProfileScreen(userId: userId),
    );
  }

  final mockUsersResponse = [
    {
      'id': 1,
      'fullName': 'Tuan Tran',
      'bio': 'Test Bio 1',
      'rating': 4.5,
      'reviewCount': 10,
      'languages': ['English', 'Vietnamese'],
      'avatarUrl': null,
      'coverPhotoUrl': null,
    },
    {
      'id': 2,
      'fullName': 'John Doe',
      'bio': 'Test Bio 2',
      'rating': 5.0,
      'reviewCount': 5,
      'languages': ['English'],
      'avatarUrl': null,
      'coverPhotoUrl': null,
    }
  ];

  testWidgets('ProfileScreen shows loading and then displays user data', (WidgetTester tester) async {
    // Mock success response
    when(mockClient.get(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer((_) async => http.Response(jsonEncode(mockUsersResponse), 200));

    await tester.pumpWidget(createProfileScreen(userId: 1));

    // Initially should show loading
    expect(find.byKey(const ValueKey('profileLoading')), findsOneWidget);

    await tester.pumpAndSettle();

    // After loading, check name and bio
    expect(find.byKey(const ValueKey('profileName')), findsOneWidget);
    expect(find.text('Tuan Tran'), findsOneWidget);
    expect(find.text('Test Bio 1'), findsOneWidget);
  });

  testWidgets('ProfileScreen shows specific user based on userId', (WidgetTester tester) async {
    when(mockClient.get(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer((_) async => http.Response(jsonEncode(mockUsersResponse), 200));

    await tester.pumpWidget(createProfileScreen(userId: 2));
    await tester.pumpAndSettle();

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Test Bio 2'), findsOneWidget);
  });

  testWidgets('ProfileScreen shows error when API fails', (WidgetTester tester) async {
    when(mockClient.get(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer((_) async => http.Response('Internal Server Error', 500));

    await tester.pumpWidget(createProfileScreen());
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('profileError')), findsOneWidget);
    expect(find.textContaining('Internal Server Error'), findsOneWidget);
  });
}
