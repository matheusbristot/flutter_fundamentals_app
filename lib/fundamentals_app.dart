import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/theme/theme_fundamentals.dart';
import 'package:flutter_fundamentals_app/core/theme/theme_unwrap.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_viewmodel.dart';
import 'package:flutter_fundamentals_app/features/dashboard/presenter/page/dashboard_page.dart';
import 'package:flutter_fundamentals_app/navigator/fundamentals_app_navigator.dart';

class FundamentalsApp extends StatefulWidget {
  const FundamentalsApp({super.key});

  @override
  State<FundamentalsApp> createState() => _FundamentalsAppState();
}

class _FundamentalsAppState extends State<FundamentalsApp>
    with WidgetsBindingObserver {
  final FundamentalsAppNavigator navigator = FundamentalsAppNavigator.instance;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return CounterViewmodel(
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: navigator.onGenerateRoute,
          home: DashBoardPage(title: 'Fundamentals'),
          builder: (context, child) {
            final themeWrap = ThemeFundamentalsWrap.on(context: context);
            return ThemeFundamentals(
              data: themeWrap.themeData,
              updateTheme: (themeWrap) => themeWrap,
              child: AnimatedTheme(
                data: themeWrap.themeData.themeData,
                child: child ?? SizedBox.shrink(),
              ),
            );
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
