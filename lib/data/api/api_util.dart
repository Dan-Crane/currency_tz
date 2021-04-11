import 'package:currency_tz/data/api/request/get_rates_body.dart';
import 'package:currency_tz/data/api/service/currency_service.dart';
import 'package:currency_tz/domain/model/rate.dart';
import 'package:flutter/material.dart';

class ApiUtil {
  const ApiUtil(this._currencyService);

  final CurrencyService _currencyService;

  Future<List<Rate>> getBaseCurrency({
    @required String baseCurrency,
    @required String amount,
  }) {
    final body = GetRatesBody(baseCurrency: baseCurrency, amount: amount);
    
    return _currencyService.getRates(body: body);
  }
}
