import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/components/bottom_navigation_bar/fundamentals_bottom_navigation_bar_container.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_viewmodel.dart';
import 'package:flutter_fundamentals_app/core/components/bottom_navigation_bar/bottom_navigation_model.dart';
import 'package:provider/provider.dart';

final class DashBoardPage extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final List<Widget> childrenFloatingActionButton;

  const DashBoardPage({
    super.key,
    required this.title,
    required this.children,
    required this.childrenFloatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationModel(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: themeData.colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: ListenableBuilder(
          listenable: context.watch<BottomNavigationModel>(),
          builder: (context, widget) {
            final innerBottomNavigationModel =
                context.read<BottomNavigationModel>();
            return children[innerBottomNavigationModel.indexSelected];
          },
        ),
        floatingActionButton: ListenableBuilder(
          listenable: context.watch<BottomNavigationModel>(),
          builder: (context, child) {
            final bottomNavigationModel = context.read<BottomNavigationModel>();
            return bottomNavigationModel.firstPageSelected
                ? childrenFloatingActionButton[
                    bottomNavigationModel.indexSelected]
                : SizedBox.shrink();
          },
        ),
        bottomNavigationBar: ListenableBuilder(
          listenable: context.watch<CounterViewmodel>(),
          builder: (context, child) {
            return context.read<CounterViewmodel>().number > 2
                ? FundamentalsBottomNavigationBarContainer()
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
