import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/components/bottom_navigation_bar/bottom_navigation_model.dart';
import 'package:flutter_fundamentals_app/core/components/bottom_navigation_bar/navigation_bar_item_widget.dart';

final class NavigatioBarItemsWidget extends StatelessWidget {
  const NavigatioBarItemsWidget({
    super.key,
    required this.theme,
    required this.model,
  });

  final ThemeData theme;
  final BottomNavigationModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: model.items.map((item) {
        int itemIndex = model.items.indexOf(item);
        Color color = model.indexSelected == itemIndex
            ? theme.primaryColor
            : theme.canvasColor;
        return NavigationBarItemWidget(
          icon: item.icon,
          label: item.label,
          iconColor: color,
          labelColor: color,
          onTap: () => model.onSelect(itemIndex),
        );
      }).toList(),
    );
  }
}
