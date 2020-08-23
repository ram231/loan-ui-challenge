import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login/index.dart';
import 'routes/index.dart';
import 'services/bottom_navigation_bar/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavigationChangeNotifier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HiRamLoginScaffold(),
        onGenerateRoute: HiRamRoutes.hiRamGeneratedRoutes,
      ),
    );
  }
}
