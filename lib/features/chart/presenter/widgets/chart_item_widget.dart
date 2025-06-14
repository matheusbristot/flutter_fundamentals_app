import 'package:flutter/material.dart';

class ChartItemWidget extends StatelessWidget {
  const ChartItemWidget({
    super.key,
    required this.remove,
    required this.index,
  });

  final VoidCallback remove;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            '/chart/detail',
            arguments: index.toString(),
          ),
          child: Hero(
            tag: 'item_$index',
            child: Text(
              'Cart Item $index',
              style: theme.textTheme.labelLarge,
            ),
          ),
        ),
        InkWell(
          onTap: remove,
          child: Icon(Icons.remove),
        )
      ],
    );
  }
}
