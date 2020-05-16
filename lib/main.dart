import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(
            0xFF3b7ed9,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              title: Text("Repayment"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("My"),
            )
          ]),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Color(0xFF397bd0),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Good day, Vince!",
                        style: textTheme.headline5.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Color(0xFF6ba1e5),
                            child: Icon(
                              Icons.subject,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Audit",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    "You have 3 loans outstanding",
                    style: textTheme.caption.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "₱ 40,000.00",
                        style: textTheme.headline5.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        child: Text(
                          "Prepayment",
                          style: textTheme.caption.copyWith(
                            color: Colors.white60,
                          ),
                        ),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white60,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(24)),
                      ),
                    ],
                  ),
                  Text(
                    "Outstanding amount",
                    style: textTheme.caption.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Color(0xFFf5f7fb),
              child: MyLoanPayments(),
            ),
          )
        ],
      ),
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
