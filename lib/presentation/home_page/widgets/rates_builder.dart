import 'package:currency_tz/domain/bloc/rates_cubit/rates_cubit.dart';
import 'package:currency_tz/domain/bloc/rates_cubit/rates_state.dart';
import 'package:currency_tz/presentation/home_page/widgets/currency_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatesBuilder extends StatelessWidget {
  const RatesBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<RatesCubit, RatesState>(
        builder: (context, state) {
          if (state is Fetching) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return const Center(child: Text('Error'));
          } else if (state is Initial) {
            return const Center(child: Text('Choise currency'));
          } else if (state is Fetched) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                padding: const EdgeInsets.all(8),
                itemCount: state.rates.length,
                itemBuilder: (BuildContext context, int index) {
                  return CurrencyItem(rate: state.rates[index]);
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
