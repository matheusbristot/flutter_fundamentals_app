import 'package:flutter/material.dart';

final class ChartItemDetail extends StatelessWidget {
  const ChartItemDetail({super.key, required this.charItem});
  final String charItem;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'item_$charItem',
      child: Text(
        charItem,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
