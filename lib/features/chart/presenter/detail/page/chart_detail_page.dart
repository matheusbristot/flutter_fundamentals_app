import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/features/chart/presenter/detail/widgets/chart_item_detail.dart';
import 'package:flutter_fundamentals_app/features/chart/router/chart_router_nav_data.dart';

final class ChartDetailPage extends StatelessWidget {
  const ChartDetailPage({
    super.key,
    required this.remove,
    required this.item,
  });

  final String item;
  final VoidCallback remove;

  static Widget builder({
    required Object? arguments,
    required VoidCallback remove,
  }) {
    final navData = ChartRouterNavDataDetail.fromArguments(arguments);
    return ChartDetailPage(
      item: navData.item,
      remove: remove,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.inversePrimary,
        title: Text('Chart Detail Page'),
      ),
      body: ChartItemDetail(charItem: item),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          remove();
          Navigator.pop(context);
        },
        child: Icon(Icons.delete),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
