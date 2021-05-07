import 'dart:convert';

import 'package:fliper_flutter_test/core/error/exceptions.dart';
import 'package:fliper_flutter_test/features/wealth_summary/data/models/wealth_summary_model.dart';
import 'package:http/http.dart' as http;

abstract class WealthSummaryRemoteDataSource {
  Future<WealthSummaryModel> getWealthSummary();
}

class WealthSummaryRemoteDataSourceImpl
    implements WealthSummaryRemoteDataSource {
  final http.Client client;

  WealthSummaryRemoteDataSourceImpl({required this.client});

  final url = Uri.parse("https://harura-fliper-test.herokuapp.com/v1/graphql");

  final headers = {
    "content-type": "application/json",
    "x-hasura-admin-secret": "fliperdevtest2020"
  };

  @override
  Future<WealthSummaryModel> getWealthSummary() async {
    final query = '''query MyQuery {
                              wealthSummary {
                                cdi
                                gain
                                hasHistory
                                id
                                profitability
                                total
                              }
                            }''';

    final response = await client.post(
      url,
      headers: headers,
      body: {"query": query},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WealthSummaryModel.fromJson(data["data"]["wealthSummary"][0]);
    } else {
      throw ServerException();
    }
  }
}
