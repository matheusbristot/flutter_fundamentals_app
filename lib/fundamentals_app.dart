import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/theme/theme_fundamentals.dart';
import 'package:flutter_fundamentals_app/core/theme/theme_unwrap.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_viewmodel.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/widgets/increment_button.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/widgets/increment_content.dart';
import 'package:flutter_fundamentals_app/features/dashboard/presenter/page/dashboard_page.dart';
import 'package:provider/provider.dart';

class FundamentalsApp extends StatefulWidget {
  const FundamentalsApp({super.key});

  @override
  State<FundamentalsApp> createState() => _FundamentalsAppState();
}

class _FundamentalsAppState extends State<FundamentalsApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CounterViewmodel()),
        ],
        builder: (context, providerChild) {
          return DashBoardPage(
            title: 'Fundamentals',
            childrenFloatingActionButton: [
              IncrementButton(
                inc: context.read<CounterViewmodel>().inc,
              ),
            ],
            children: [
              IncrementContent(
                counterViewmodel: context.watch<CounterViewmodel>(),
                themeData: Theme.of(context),
              ),
              Center(
                child: Text('List Page',
                    style: Theme.of(context).textTheme.bodyLarge),
              )
            ],
          );
        },
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final themeWrap = ThemeFundamentalsWrap.on(context: context);
        return ThemeFundamentals(
          data: themeWrap.themeData,
          child: AnimatedTheme(
            data: themeWrap.themeData.themeData,
            child: child ?? SizedBox.shrink(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
