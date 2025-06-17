import 'package:flutter_fundamentals_app/core/navigator/fundamentals_nav_register.dart';
import 'package:flutter_fundamentals_app/core/navigator/fundamentals_nav_route.dart';
import 'package:flutter_fundamentals_app/features/chart/presenter/detail/page/chart_detail_page.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_action.dart';
import 'package:flutter_fundamentals_app/features/chart/router/chart_router_nav_data.dart';
import 'package:flutter_fundamentals_app/features/counter/presenter/viewmodel/counter_viewmodel.dart';

typedef ChartRouterNavDataDetailRouteParameters
    = Map<String, FundamentalsNavRoute<ChartRouterNavDataDetail>>;
typedef ChartRouteNavDataDetailRouteArguments
    = FundamentalsNavRoute<ChartRouterNavDataDetail>;

final class ChartRouter
    extends BaseFundamentalsNavRegister<ChartRouterNavData> {
  ChartRouter(super.settings) {
    addFeatureRoutes(chartDetail);
  }

  ChartRouterNavDataDetailRouteParameters get chartDetail => {
        '/chart/detail': ChartRouteNavDataDetailRouteArguments(
          routePath: '/chart/detail',
          builder: (context) => ChartDetailPage.builder(
            arguments: super.settings.arguments,
            remove: () => CounterViewmodel.of(context).counterData.execute(
                  CounterAction.decrement,
                ),
          ),
        ),
      };
}
