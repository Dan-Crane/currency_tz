import 'package:equatable/equatable.dart';

class CurrncyPickerState extends Equatable {
  const CurrncyPickerState({
    this.currentCurrency,
    this.currencyList = const ['RUB', 'USD', 'VND', 'EUR'],
  });

  final String currentCurrency;
  final List<String> currencyList;

  CurrncyPickerState copyWith({
    String currentCurrency,
    List<String> currencyList,
  }) {
    return CurrncyPickerState(
      currentCurrency: currentCurrency ?? this.currentCurrency,
      currencyList: currencyList ?? this.currencyList,
    );
  }

  @override
  List<Object> get props => [currentCurrency, currencyList];
}
