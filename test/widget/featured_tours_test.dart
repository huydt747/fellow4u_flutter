import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/screens/explore/widgets/featured_tours_section.dart';
import 'package:flutter_application_1/core/services/api_service.dart';
import '../unit/api_service_test.mocks.dart';

void main() {
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    ApiService.client = mockClient;
  });

  Widget createFeaturedToursSection() {
    return const MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: FeaturedToursSection(),
        ),
      ),
    );
  }

  final mockToursResponse = [
    {
      'id': 1,
      'title': 'Da Nang City Tour',
      'date': 'Oct 10, 2023',
      'duration': '8 hours',
      'price': 50.0,
      'likes': 120,
      'imageUrl': 'img/scene/1.png',
    },
    {
      'id': 2,
      'title': 'Hoi An Ancient Town',
      'date': 'Oct 11, 2023',
      'duration': '4 hours',
      'price': 30.0,
      'likes': 85,
      'imageUrl': 'img/scene/2.png',
    }
  ];

  testWidgets('FeaturedToursSection displays list of tours from API', (WidgetTester tester) async {
    when(mockClient.get(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer((invocation) async {
      final Uri uri = invocation.positionalArguments[0];
      if (uri.toString().contains('api/tours')) {
        return http.Response(jsonEncode(mockToursResponse), 200);
      }
      // Mock image data response for ServerImage
      return http.Response(jsonEncode({'data': 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg=='}), 200);
    });

    await tester.pumpWidget(createFeaturedToursSection());

    expect(find.byKey(const ValueKey('toursLoading')), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('tourCard_0')), findsOneWidget);
    expect(find.byKey(const ValueKey('tourCard_1')), findsOneWidget);
    expect(find.text('Da Nang City Tour'), findsOneWidget);
    expect(find.text('Hoi An Ancient Town'), findsOneWidget);
  });

  testWidgets('FeaturedToursSection shows empty state when no tours', (WidgetTester tester) async {
    when(mockClient.get(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer((_) async => http.Response(jsonEncode([]), 200));

    await tester.pumpWidget(createFeaturedToursSection());
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('noToursFound')), findsOneWidget);
    expect(find.text('No tours found'), findsOneWidget);
  });
}
