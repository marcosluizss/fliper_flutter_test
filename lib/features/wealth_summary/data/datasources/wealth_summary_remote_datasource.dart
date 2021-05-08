import 'dart:convert';

import 'package:fliper_flutter_test/core/error/exceptions.dart';
import 'package:fliper_flutter_test/features/wealth_summary/data/models/wealth_summary_model.dart';
import 'package:http/http.dart' as http;

import '../../../../globals.dart';

abstract class WealthSummaryRemoteDataSource {
  Future<WealthSummaryModel> getWealthSummary();
}

class WealthSummaryRemoteDataSourceImpl
    implements WealthSummaryRemoteDataSource {
  final http.Client client;

  WealthSummaryRemoteDataSourceImpl({required this.client});

  final url = Uri.parse(SERVER_URL);

  final headers = {
    "content-type": "application/json",
    "x-hasura-admin-secret": HASURA_SECRET
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
      body: jsonEncode({"query": query}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WealthSummaryModel.fromJson(data["data"]["wealthSummary"][0]);
    } else {
      throw ServerException();
    }
  }
}
