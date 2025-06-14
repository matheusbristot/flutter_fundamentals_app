import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/components/feedback/feedback_neutral.dart';
import 'package:flutter_fundamentals_app/features/chart/presenter/widgets/chart_item_widget.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_viewmodel.dart';
import 'package:provider/provider.dart';

class ChartListWidget extends StatelessWidget {
  const ChartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CounterViewmodel>();
    final total = viewModel.number;

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
          remove: () => viewModel.dec(),
          index: index,
        ),
      ),
    );

    return ListView.builder(
      itemBuilder: (context, index) => texts[index],
      itemCount: texts.length,
    );
  }
}
