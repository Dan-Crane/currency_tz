import 'package:currency_tz/data/api/model/latest.dart';
import 'package:currency_tz/data/api/request/get_rates_body.dart';
import 'package:currency_tz/domain/model/rate.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class CurrencyService {
  static const String _baseUrl = 'api.exchangerate.host';

  Future<List<Rate>> getRates({@required GetRatesBody body}) async {
    final url = Uri.https(_baseUrl, 'latest', body.toApi());

    try {
      final response = await https.get(url);
      final data = latestFromJson(response.body);

      final ratesList =
          data.rates.entries.map((e) => Rate(e.key, e.value)).toList();

      return ratesList;
    } catch (e) {
      throw GetRatesException();
    }
  }
}

// exceptions 
class GetRatesException implements Exception {}
