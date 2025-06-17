import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/components/bottom_navigation_bar/bottom_navigation_model.dart';
import 'package:flutter_fundamentals_app/core/components/bottom_navigation_bar/navigation_bar_item_widget.dart';

final class NavigatioBarItemsWidget extends StatelessWidget {
  const NavigatioBarItemsWidget({
    super.key,
    required this.model,
  });

  final BottomNavigationModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: model.items.map((item) {
        int itemIndex = model.items.indexOf(item);
        bool isSelected = model.indexSelected == itemIndex;
        return NavigationBarItemWidget(
          icon: item.icon,
          label: item.label,
          selected: isSelected,
          onTap: () => model.onSelectItem.execute(itemIndex),
        );
      }).toList(),
    );
  }
}
