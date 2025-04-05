import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/viewmodel/result.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_viewmodel.dart';

final class IncrementContent extends StatelessWidget {
  const IncrementContent({
    super.key,
    required this.counterViewmodel,
    required this.themeData,
  });

  final CounterViewmodel counterViewmodel;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have generated the total of:',
          ),
          counterViewmodel.result is Success
              ? Text(
                  '${(counterViewmodel.result as Success).value}',
                  style: themeData.textTheme.headlineMedium,
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
