import 'package:flutter/material.dart';

final class IncrementButton extends StatelessWidget {
  const IncrementButton({
    super.key,
    required this.inc,
  });

  final ValueGetter inc;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => inc(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
