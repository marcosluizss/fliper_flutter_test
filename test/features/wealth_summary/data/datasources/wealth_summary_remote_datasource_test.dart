import 'dart:convert';

import 'package:fliper_flutter_test/core/error/exceptions.dart';
import 'package:fliper_flutter_test/features/wealth_summary/data/datasources/wealth_summary_remote_datasource.dart';
import 'package:fliper_flutter_test/features/wealth_summary/data/models/wealth_summary_model.dart';
import 'package:fliper_flutter_test/globals.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {
  @override
  Future<Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) =>
      super.noSuchMethod(
          Invocation.method(#post, [url, headers, body, encoding])) ??
      Future.value(Response('', 500));
}

void main() {
  late WealthSummaryRemoteDataSourceImpl remoteDataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSource =
        WealthSummaryRemoteDataSourceImpl(client: mockHttpClient);
  });

  final tWealthSummaryModel = WealthSummaryModel(
    id: 2,
    cdi: 3.45679,
    gain: 1833.23,
    hasHistory: true,
    profitability: 2.76789,
    total: 3200876,
  );

  test('''should perform a POST request on a URL and validate
          header with application/json and secret key''', () async {
    when(mockHttpClient.post(any, headers: any, body: any, encoding: any))
        .thenAnswer(
      (_) async => http.Response(
          fixture('wealth_summary_datasource_response.json'), 200),
    );

    remoteDataSource.getWealthSummary();

    verify(mockHttpClient.post(
      Uri.parse(SERVER_URL),
      headers: {
        "content-type": "application/json",
        "x-hasura-admin-secret": HASURA_SECRET
      },
      body: any,
    ));
  });

  test(
      'should return a WealthSummaryModel when the response code is 200 ( success )',
      () async {
    when(mockHttpClient.post(any, headers: any, body: any, encoding: any))
        .thenAnswer(
      (_) async => http.Response(
          fixture('wealth_summary_datasource_response.json'), 200),
    );

    final result = await remoteDataSource.getWealthSummary();

    expect(result, tWealthSummaryModel);
  });

  test('should return a ServerException when the response code is 404 or orher',
      () async {
    when(mockHttpClient.post(any, headers: any, body: any, encoding: any))
        .thenAnswer((_) async => http.Response('Somehting went wrong', 404));

    final call = remoteDataSource.getWealthSummary;

    expect(() => call(), throwsA(isInstanceOf<ServerException>()));
  });
}
