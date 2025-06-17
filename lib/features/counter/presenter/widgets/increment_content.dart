import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_viewmodel.dart';

final class IncrementContent extends StatelessWidget {
  const IncrementContent({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListenableBuilder(
        listenable: CounterViewmodel.of(context).counterData,
        builder: (context, child) {
          final count = CounterViewmodel.of(context).count;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have generated the total of:',
              ),
              Text(
                '$count',
                style: themeData.textTheme.headlineMedium,
              )
            ],
          );
        },
      ),
    );
  }
}
