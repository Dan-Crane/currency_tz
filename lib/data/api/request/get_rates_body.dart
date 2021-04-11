import 'package:meta/meta.dart';

class GetRatesBody {
  final String baseCurrency;
  final String amount;

  GetRatesBody({
    @required this.baseCurrency,
    @required this.amount,
  });

  Map<String, String> toApi() {
    return {
      'base': baseCurrency,
      'amount': amount,
    };
  }
}