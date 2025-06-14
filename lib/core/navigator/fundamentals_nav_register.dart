import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/navigator/fundamentals_nav_route.dart';

abstract interface class FundamentalsNavRegister<T extends Object?> {
  late Map<String, FundamentalsNavRoute<T>> routes;
}

base class BaseFundamentalsNavRegister<T extends Object?>
    implements FundamentalsNavRegister {
  final RouteSettings settings;
  @protected
  late Map<String, FundamentalsNavRoute<T>> _routes;

  BaseFundamentalsNavRegister(this.settings) {
    _routes = <String, FundamentalsNavRoute<T>>{};
  }

  @override
  Map<String, FundamentalsNavRoute<T>> get routes => _routes;

  @protected
  void addFeatureRoutes(
    Map<String, FundamentalsNavRoute<T>> routes,
  ) {
    _routes.addAll(HashMap.from(routes));
  }

  @override
  set routes(Map<String, FundamentalsNavRoute<Object?>> routes) {
    this._routes = routes.cast<String, FundamentalsNavRoute<T>>();
  }
}
