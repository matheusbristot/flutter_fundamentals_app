import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/components/bottom_navigation_bar/bottom_navigation_model.dart';
import 'package:flutter_fundamentals_app/core/components/bottom_navigation_bar/navigation_bar_items_widget.dart';
import 'package:flutter_fundamentals_app/features/chart/presenter/widgets/chart_list_widget.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_action.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_viewmodel.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/widgets/increment_button.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/widgets/increment_content.dart';

final class DashBoardPage extends StatelessWidget {
  final String title;

  const DashBoardPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationModel(
      child: Builder(
        builder: (context) {
          final model = BottomNavigationModel.of(context);
          final listenable = model.onSelectItem;

          Widget buildBody() {
            if (model.indexSelected == 0) {
              return IncrementContent(themeData: Theme.of(context));
            } else {
              return ChartListWidget();
            }
          }

          Widget buildFab() {
            if (model.firstPageSelected) {
              return IncrementButton(
                inc: () => CounterViewmodel.of(context)
                    .counterData
                    .execute(CounterAction.increment),
              );
            }
            return const SizedBox.shrink();
          }

          final theme = Theme.of(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: theme.colorScheme.inversePrimary,
              title: Text(title),
            ),
            body: ListenableBuilder(
              listenable: listenable,
              builder: (context, _) => buildBody(),
            ),
            floatingActionButton: ListenableBuilder(
              listenable: listenable,
              builder: (context, _) => buildFab(),
            ),
            bottomNavigationBar: Container(
              height: 64,
              margin: const EdgeInsets.only(right: 16, left: 16, bottom: 24),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 20,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: NavigatioBarItemsWidget(model: model),
            ),
          );
        },
      ),
    );
  }
}
