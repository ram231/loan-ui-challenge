import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dashboard/index.dart';
import '../login/index.dart';

const routeLogin = '/';
const routeIntro = '/intro';
const routeDashboard = '/dashboard';
const routeProfile = '/profile';
const routeLoans = '/loans';

class HiRamRoutes {
  static Route hiRamGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case routeIntro:
      case routeDashboard:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => HiRamDashboardScaffold(),
        );
      case routeProfile:
      case routeLoans:
      default:
        return CupertinoPageRoute(
          builder: (context) => HiRamLoginScaffold(),
        );
    }
  }
}
