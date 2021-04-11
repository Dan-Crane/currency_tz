import 'package:currency_tz/domain/bloc/currency_picker_cubit/currency_picker_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPickerCubit extends Cubit<CurrncyPickerState> {
  CurrencyPickerCubit() : super(CurrncyPickerState());

  currencyChanged(String currency) {
    emit(state.copyWith(currentCurrency: currency));
  }
}
