import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_application_1/core/services/api_service.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
import 'api_service_test.mocks.dart';

void main() {
  group('ApiService Tests', () {
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
    });

    test('post returns data if the http call completes successfully', () async {
      final responseBody = {'id': 1, 'name': 'Test User'};
      
      when(mockClient.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(jsonEncode(responseBody), 200));

      final result = await ApiService.post('test-path', {'key': 'value'}, client: mockClient);

      expect(result, isA<Map<String, dynamic>>());
      expect(result['id'], 1);
      expect(result['name'], 'Test User');
    });

    test('post throws an exception if the http call completes with an error', () async {
      when(mockClient.post(
        any,
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('{"message": "Unauthorized"}', 401));

      expect(
        () => ApiService.post('test-path', {'key': 'value'}, client: mockClient),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Unauthorized'))),
      );
    });

    test('get returns data if the http call completes successfully', () async {
      final responseBody = [{'id': 1, 'name': 'Item 1'}];
      
      when(mockClient.get(
        any,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(jsonEncode(responseBody), 200));

      final result = await ApiService.get('test-path', client: mockClient);

      expect(result, isA<List>());
      expect(result[0]['id'], 1);
    });
  });
}
