import 'package:currency_tz/domain/model/rate.dart';
import 'package:meta/meta.dart';

abstract class CurrencyRepo {
  Future<List<Rate>> getRates({
    @required String baseCurrency,
    @required String amount,
  });
}
