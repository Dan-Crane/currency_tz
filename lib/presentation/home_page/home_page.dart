import 'package:currency_tz/domain/bloc/currency_picker_cubit/currency_picker_cubit.dart';
import 'package:currency_tz/domain/bloc/currency_picker_cubit/currency_picker_state.dart';
import 'package:currency_tz/domain/bloc/rates_cubit/rates_cubit.dart';
import 'package:currency_tz/internal/dependencies/bloc_module.dart';
import 'package:currency_tz/presentation/home_page/widgets/currency_picker.dart';
import 'package:currency_tz/presentation/home_page/widgets/rates_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BlocModule.currencyPickerCubit()),
        BlocProvider(create: (_) => BlocModule.ratesCubit()),
      ],
      child: _HomePageListener(),
    );
  }
}

class _HomePageListener extends StatelessWidget {
  const _HomePageListener({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ratesCubit = context.read<RatesCubit>();

    return BlocListener<CurrencyPickerCubit, CurrncyPickerState>(
      listener: (context, state) {
        ratesCubit.getRates(state.currentCurrency, '1');
      },
      child: _HomePageView(),
    );
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page')),
      body: Column(
        children: [
          CurrencyPicker(),
          RatesBuilder(),
        ],
      ),
    );
  }
}
