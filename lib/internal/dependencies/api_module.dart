import 'package:currency_tz/data/api/api_util.dart';
import 'package:currency_tz/data/api/service/currency_service.dart';

class ApiModule{
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(CurrencyService());
    }
    return _apiUtil;
  }
}