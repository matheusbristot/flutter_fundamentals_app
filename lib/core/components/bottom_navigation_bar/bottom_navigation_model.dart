import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/features/dashboard/domain/entity/dashboard_item.dart';

final class BottomNavigationModel with ChangeNotifier {
  final List<DashboardItem> _items = <DashboardItem>[
    DashboardItem(
      true,
      icon: Icons.add,
      label: 'Add',
    ),
    DashboardItem(
      false,
      icon: Icons.list,
      label: 'List',
    ),
  ];

  UnmodifiableListView<DashboardItem> get items => UnmodifiableListView(_items);
  bool get firstPageSelected => _items.first.selected;
  int get indexSelected => items.indexWhere((item) => item.selected);

  void onSelect(int index) {
    if (_items[index].selected) return;
    final newItems = _items.map(
      (item) => DashboardItem(
        !item.selected,
        icon: item.icon,
        label: item.label,
      ),
    );
    _items.setAll(0, newItems);

    notifyListeners();
  }
}
