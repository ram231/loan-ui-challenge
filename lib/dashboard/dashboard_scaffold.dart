import 'package:flutter/material.dart';

class HeaderDashboard extends StatelessWidget {
  const HeaderDashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          HeaderNameDashboard(),
          Text(
            "You have 3 loans outstanding",
            style: textTheme.caption.copyWith(
              color: Colors.white54,
            ),
          ),
          Spacer(),
          CurrentBalanceDashboard(),
          Text(
            "Outstanding amount",
            style: textTheme.caption.copyWith(
              color: Colors.white54,
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentBalanceDashboard extends StatelessWidget {
  const CurrentBalanceDashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
    );
  }
}
