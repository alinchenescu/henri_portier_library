// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'screens/home_screen.dart' as _i2;
import 'screens/splash_screen.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    HomeNavScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeNavScreen());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(SplashScreen.name, path: '/splash-screen'),
        _i3.RouteConfig(HomeNavScreen.name, path: '/')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i3.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/splash-screen');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.HomeNavScreen]
class HomeNavScreen extends _i3.PageRouteInfo<void> {
  const HomeNavScreen() : super(HomeNavScreen.name, path: '/');

  static const String name = 'HomeNavScreen';
}
