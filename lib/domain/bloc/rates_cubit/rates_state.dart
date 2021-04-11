import 'package:currency_tz/domain/model/rate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RatesState extends Equatable {
  const RatesState();

  @override
  List<Object> get props => [];
}

class Initial extends RatesState {}

class Fetching extends RatesState {}

class Fetched extends RatesState {
  const Fetched({@required this.rates});

  final List<Rate> rates;

  @override
  List<Object> get props => [rates];
}

class Error extends RatesState{}