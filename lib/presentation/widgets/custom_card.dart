import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key, @required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
      ),
      // constraints: BoxConstraints(maxHeight: 100, maxWidth: 800),
      child: Column(
        children: children,
      ),
    );
  }
}
