import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/components/bottom_navigation_bar/bottom_navigation_model.dart';
import 'package:flutter_fundamentals_app/core/components/bottom_navigation_bar/navigation_bar_items_widget.dart';
import 'package:provider/provider.dart';

final class FundamentalsBottomNavigationBarContainer
    extends Consumer<BottomNavigationModel> {
  FundamentalsBottomNavigationBarContainer({
    super.key,
  }) : super(
          builder: (context, model, _) {
            final theme = Theme.of(context);
            return Container(
              height: 64,
              margin: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 24,
              ),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 20,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: NavigatioBarItemsWidget(
                theme: theme,
                model: model,
              ),
            );
          },
        );
}
