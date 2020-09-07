import 'package:flutter/material.dart';
import 'package:hiram/helpers/colors.dart';
import 'package:provider/provider.dart';

import '../profile/profile_scaffold.dart';
import '../services/bottom_navigation_bar/index.dart';

class HiRamDashboardScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Building $this');
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        endDrawer: Drawer(),
        resizeToAvoidBottomInset: false,
        floatingActionButton: TransactionFAB(),
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
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
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
              HeaderDashboard(),
              AccountActions(),
              Expanded(
                flex: 4,
                child: Container(
                  color: Color(0xFFf5f7fb),
                  child: MyLoanPayments(),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

class TransactionFAB extends StatefulWidget {
  const TransactionFAB({
    Key key,
  }) : super(key: key);

  @override
  _TransactionFABState createState() => _TransactionFABState();
}

class _TransactionFABState extends State<TransactionFAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await showModalBottomSheet<bool>(
          context: context,
          builder: (context) => TransactionBottomSheet(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          isDismissible: false,
        );
      },
      child: Icon(Icons.note_add),
    );
  }
}

class TransactionBottomSheet extends StatelessWidget {
  TransactionBottomSheet({
    Key key,
  }) : super(key: key);
  final GlobalKey _formKey =
      GlobalKey<FormState>(debugLabel: 'add transaction');
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: 300,
        child: ListView(physics: BouncingScrollPhysics(), children: [
          Center(
            child: Text('Choose Transaction Type'),
          ),
          TransactionDropdownForm()
        ]),
      ),
    );
  }
}

class TransactionDropdownForm extends StatefulWidget {
  const TransactionDropdownForm({
    Key key,
    TextEditingController controller,
    Function(String) onChange,
  }) : super(key: key);

  @override
  _TransactionDropdownFormState createState() =>
      _TransactionDropdownFormState();
}

class _TransactionDropdownFormState extends State<TransactionDropdownForm> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: [
        DropdownMenuItem(child: Text('Bank')),
        DropdownMenuItem(child: Text('Card')),
      ],
      onChanged: (value) {},
    );
  }
}

class AccountActions extends StatelessWidget {
  const AccountActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              offset: Offset(0, 1),
            )
          ],
        ),
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'What would you like to do?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              FittedBox(
                child: Row(children: [
                  MaterialButton(
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.account_balance),
                          SizedBox(width: 8),
                          Text('Bank Transaction')
                        ],
                      ),
                    ),
                    onPressed: () {},
                  ),
                  VerticalDivider(),
                  MaterialButton(
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.account_balance_wallet),
                          SizedBox(width: 8),
                          Text('My Card ID')
                        ],
                      ),
                    ),
                    onPressed: () {},
                  )
                ]),
              )
            ],
          ),
        ),
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
      title: 'Logistics freight credit',
      period: '1/2 period',
      overdue: 'Overdue 7 day',
      payment: '20,000.00',
      icon: Icon(
        Icons.monetization_on,
        color: Colors.yellow,
      ),
    ),
    LoanPayment(
      title: 'Swift bank loan',
      period: '1/1 period',
      overdue: 'Before the due date 2 day',
      payment: '6,000.00',
      icon: Icon(
        Icons.security,
        color: Colors.blue,
      ),
    ),
    LoanPayment(
      title: 'Swift bank loan',
      period: '1/1 period',
      overdue: 'Before the due date 30 day',
      payment: '6,000.00',
      icon: Icon(
        Icons.security,
        color: Colors.blue,
      ),
    ),
    LoanPayment(
      title: 'Swift bank loan',
      period: '1/1 period',
      overdue: 'Before the due date 30 day',
      payment: '6,000.00',
      icon: Icon(
        Icons.security,
        color: Colors.blue,
      ),
    ),
    LoanPayment(
      title: 'Swift bank loan',
      period: '1/1 period',
      overdue: 'Before the due date 2 day',
      payment: '6,000.00',
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
                      'Repayment',
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

class HeaderDashboard extends StatelessWidget {
  const HeaderDashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF5ea5ce),
            Color(0xFF1944c3),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: HeaderNameDashboard(),
    );
  }
}

class HeaderNameDashboard extends StatelessWidget {
  const HeaderNameDashboard({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        Text(
          'Good day, Vince!',
          style: textTheme.headline5.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.notifications_active, color: Colors.white),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
        SizedBox(width: 8),
      ],
    );
  }
}
