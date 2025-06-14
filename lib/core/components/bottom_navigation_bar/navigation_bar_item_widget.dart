import 'package:flutter/material.dart';

final class NavigationBarItemWidget extends StatelessWidget {
  const NavigationBarItemWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    Color color = selected
        ? theme.colorScheme.onSecondaryContainer
        : theme.colorScheme.onPrimaryContainer;

    final IconThemeData iconTheme = IconTheme.of(context);

    return InkWell(
      onTap: onTap,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: 16,
                left: 36,
                right: 36,
                bottom: 0,
              ),
              child: Icon(icon, color: iconTheme.color),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: color,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                    fontSize: selected ? 14 : 12,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
