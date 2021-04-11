import 'package:currency_tz/domain/bloc/currency_picker_cubit/currency_picker_cubit.dart';
import 'package:currency_tz/domain/bloc/rates_cubit/rates_cubit.dart';
import 'package:currency_tz/internal/dependencies/repository_module.dart';

class BlocModule {
  // HomePage
  static CurrencyPickerCubit currencyPickerCubit() {
    return CurrencyPickerCubit();
  }

  static RatesCubit ratesCubit() {
    return RatesCubit(currencyRepo: RepositoryModule.currencyRepo());
  }
}
