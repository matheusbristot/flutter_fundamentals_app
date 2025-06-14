import 'package:flutter/material.dart';

base class FundamentalsNavRoute<Arguments extends Object?>
    extends MaterialPageRoute<Arguments> {
  final String routePath;
  final Arguments? arguments;

  FundamentalsNavRoute({
    required this.routePath,
    required super.builder,
    this.arguments,
  }) : super(
          settings: RouteSettings(
            name: routePath,
            arguments: arguments,
          ),
        );
}
