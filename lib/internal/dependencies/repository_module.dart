import 'package:currency_tz/data/repository/currency_repo_impl.dart';
import 'package:currency_tz/domain/repository/currency_repo.dart';
import 'package:currency_tz/internal/dependencies/api_module.dart';

class RepositoryModule {
  static CurrencyRepo _currencyRepo;

  static CurrencyRepo currencyRepo() {
    if (_currencyRepo == null) {
      _currencyRepo = CurrencyRepoImpl(ApiModule.apiUtil());
    }
    return _currencyRepo;
  }
}
