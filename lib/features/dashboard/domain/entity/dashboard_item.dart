import 'package:flutter/widgets.dart';

@immutable
class DashboardItem {
  const DashboardItem(
    this.selected, {
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
  final bool selected;
}
