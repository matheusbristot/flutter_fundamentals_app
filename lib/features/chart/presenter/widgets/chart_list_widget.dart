import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/components/feedback/feedback_neutral.dart';
import 'package:flutter_fundamentals_app/features/chart/presenter/widgets/chart_item_widget.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_action.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_viewmodel.dart';

final class ChartListWidget extends StatelessWidget {
  const ChartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: CounterViewmodel.of(context).counterData,
      builder: (context, _) {
        final viewModel = CounterViewmodel.of(context);
        final value = viewModel.counterData.value;
        if (value.isExecuting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (value.isSuccess || value.isInitial) {
          final total = viewModel.count;
          if (total == 0) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FeedbackNeutralLarge(
                  'Please change to + Add and insert a new item',
                ),
              ),
            );
          }

          final texts = List.generate(
            total,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChartItemWidget(
                remove: () => viewModel.counterData.execute(
                  CounterAction.decrement,
                ),
                index: index,
              ),
            ),
          );
          return ListView.builder(
            itemBuilder: (context, index) => texts[index],
            itemCount: texts.length,
          );
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FeedbackNeutralLarge(
              'Please change to + Add and insert a new item',
            ),
          ),
        );
      },
    );
  }
}
