import 'package:flutter/material.dart';
import 'package:loan_payment_challenge/login/index.dart';
import 'package:loan_payment_challenge/profile/profile_scaffold.dart';
import 'package:loan_payment_challenge/routes/index.dart';
import 'package:loan_payment_challenge/services/bottom_navigation_bar/index.dart';
import 'package:provider/provider.dart';

import 'dashboard/index.dart';

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
