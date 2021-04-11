import 'package:currency_tz/domain/model/rate.dart';
import 'package:flutter/material.dart';

class CurrencyItem extends StatelessWidget {
  const CurrencyItem({Key key, @required this.rate}) : super(key: key);

  final Rate rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(text: 'Currency: ', style: titleTextTitle()),
                TextSpan(text: rate.name),
              ],
            ),
          ),
          Divider(
            color: Colors.black12,
            indent: 20,
            endIndent: 20,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(text: 'Value: ', style: titleTextTitle()),
                TextSpan(text: rate.value.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextStyle titleTextTitle() => TextStyle(fontWeight: FontWeight.bold);
}
