import 'package:currency_tz/data/api/api_util.dart';
import 'package:currency_tz/domain/model/rate.dart';
import 'package:currency_tz/domain/repository/currency_repo.dart';
import 'package:meta/meta.dart';

class CurrencyRepoImpl implements CurrencyRepo {
  const CurrencyRepoImpl(this._apiUtil);

  final ApiUtil _apiUtil;

  Future<List<Rate>> getRates({
    @required String baseCurrency,
    @required String amount,
  }) {
    return _apiUtil.getBaseCurrency(baseCurrency: baseCurrency, amount: amount);
  }
}
