import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/viewmodel/command.dart';
import 'package:flutter_fundamentals_app/core/viewmodel/result.dart';
import 'package:flutter_fundamentals_app/features/dashboard/domain/entity/dashboard_item.dart';

final class BottomNavigationModel extends InheritedWidget {
  BottomNavigationModel({
    super.key,
    required super.child,
  });

  static BottomNavigationModel of(BuildContext context) {
    final BottomNavigationModel? result =
        context.dependOnInheritedWidgetOfExactType<BottomNavigationModel>();
    assert(result != null, 'No BottomNavigationModel found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant BottomNavigationModel oldWidget) {
    return oldWidget._items != _items;
  }

  late final onSelectItem = Command1(onSelect);

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

  AsyncResult<List<DashboardItem>> onSelect(int index) async {
    if (_items[index].selected) return Future.value(onSelectItem.value);
    final newItems = _items.map(
      (item) => DashboardItem(
        !item.selected,
        icon: item.icon,
        label: item.label,
      ),
    );
    _items.setAll(0, newItems);
    return Future.value(Result.success(items));
  }
}
