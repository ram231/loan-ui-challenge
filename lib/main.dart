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

class HiRamDashboardScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Building ${this.toString()}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        },
        label: Text(
          "Lend an item",
        ),
        icon: Icon(Icons.note_add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: Consumer<BottomNavigationChangeNotifier>(
        builder: (context, model, _) => BottomNavigationBar(
            onTap: (index) {
              context
                  .read<BottomNavigationChangeNotifier>()
                  .setCurrentIndex(index);
            },
            currentIndex: model.currentIndex,
            selectedItemColor: Color(
              0xFF3b7ed9,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
              )
            ]),
      ),
      body: Consumer<BottomNavigationChangeNotifier>(
          builder: (context, model, _) {
        if (model.currentIndex == 1) {
          return HiRamProfileBody();
        }
        return Column(
          children: <Widget>[
            Expanded(
              child: HeaderDashboard(),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Color(0xFFf5f7fb),
                child: MyLoanPayments(),
              ),
            )
          ],
        );
      }),
    );
  }
}

class MyLoanPayments extends StatefulWidget {
  @override
  _MyLoanPaymentsState createState() => _MyLoanPaymentsState();
}

class _MyLoanPaymentsState extends State<MyLoanPayments> {
  final List<LoanPayment> payments = [
    LoanPayment(
      title: "Logistics freight credit",
      period: "1/2 period",
      overdue: "Overdue 7 day",
      payment: "20,000.00",
      icon: Icon(
        Icons.monetization_on,
        color: Colors.yellow,
      ),
    ),
    LoanPayment(
      title: "Swift bank loan",
      period: "1/1 period",
      overdue: "Before the due date 2 day",
      payment: "6,000.00",
      icon: Icon(
        Icons.security,
        color: Colors.blue,
      ),
    ),
    LoanPayment(
      title: "Swift bank loan",
      period: "1/1 period",
      overdue: "Before the due date 30 day",
      payment: "6,000.00",
      icon: Icon(
        Icons.security,
        color: Colors.blue,
      ),
    ),
    LoanPayment(
      title: "Swift bank loan",
      period: "1/1 period",
      overdue: "Before the due date 30 day",
      payment: "6,000.00",
      icon: Icon(
        Icons.security,
        color: Colors.blue,
      ),
    ),
    LoanPayment(
      title: "Swift bank loan",
      period: "1/1 period",
      overdue: "Before the due date 2 day",
      payment: "6,000.00",
      icon: Icon(
        Icons.security,
        color: Colors.blue,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: payments.length,
      itemBuilder: (context, index) {
        final payment = payments[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(2, 5),
                  color: Colors.grey[200],
                )
              ]),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  payment.icon,
                  SizedBox(width: 8),
                  Text(
                    payment.title,
                    style: textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    payment.period,
                    style: textTheme.caption.copyWith(
                      color: Colors.black26,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.black26,
                thickness: 0.7,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        payment.payment,
                        style: textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1e3f64),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          payment.overdue,
                          style: textTheme.caption.copyWith(
                            color: Colors.black38,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Color(0xFF3b77ce),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      "Repayment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class LoanPayment {
  final String title;
  final Icon icon;
  final String period;
  final String overdue;
  final String payment;

  const LoanPayment({
    this.icon,
    this.overdue,
    this.payment,
    this.period,
    this.title,
  });
}
