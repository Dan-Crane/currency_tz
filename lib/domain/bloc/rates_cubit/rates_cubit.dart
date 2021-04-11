import 'package:currency_tz/data/api/service/currency_service.dart';
import 'package:currency_tz/domain/bloc/rates_cubit/rates_state.dart';
import 'package:currency_tz/domain/repository/currency_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class RatesCubit extends Cubit<RatesState> {
  RatesCubit({@required CurrencyRepo currencyRepo})
      : _currencyRepo = currencyRepo,
        super(Initial());

  final CurrencyRepo _currencyRepo;

  Future<void> getRates(String baseCurrency, String amount) async {
    emit(Fetching());

    try {
      final response = await _currencyRepo
          .getRates(
            baseCurrency: baseCurrency,
            amount: amount,
          )
          .timeout(const Duration(seconds: 10));

      emit(Fetched(rates: response));
    } on GetRatesException {
      emit(Error());
    } on dynamic catch (e) {
      emit(Error());
      print(e);
      rethrow;
    }
  }
}
