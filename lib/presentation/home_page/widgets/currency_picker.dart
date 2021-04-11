import 'package:currency_tz/domain/bloc/currency_picker_cubit/currency_picker_cubit.dart';
import 'package:currency_tz/domain/bloc/currency_picker_cubit/currency_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPicker extends StatelessWidget {
  const CurrencyPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyCubit = context.watch<CurrencyPickerCubit>();

    return BlocBuilder<CurrencyPickerCubit, CurrncyPickerState>(
      builder: (ctx, state) => DropdownButton<String>(
        value: state.currentCurrency,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.blue),
        underline: Container(height: 2, color: Colors.black12),
        hint: Text("Please choose a currency", style: textStyle(context)),
        onChanged: (String value) => currencyCubit.currencyChanged(value),
        items: state.currencyList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }

  TextStyle textStyle(context) =>
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
}
