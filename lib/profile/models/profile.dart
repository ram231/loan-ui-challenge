import 'package:equatable/equatable.dart';

import 'account_details.dart';

enum Gender {
  male,
  female,
}

class User extends Equatable {
  final String name;
  final String password;
  final String email;
  final Gender gender;
  final int contactNum;
  final int age;

  final AccountDetails transactionDetails;
  User({
    this.name,
    this.password,
    this.email,
    this.gender,
    this.contactNum,
    this.age,
    this.transactionDetails,
  });

  @override
  List<Object> get props {
    return [
      name,
      password,
      email,
      gender,
      contactNum,
      age,
      transactionDetails,
    ];
  }

  User copyWith({
    String name,
    String password,
    String email,
    Gender gender,
    int contactNum,
    int age,
    AccountDetails transactionDetails,
  }) {
    return User(
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      contactNum: contactNum ?? this.contactNum,
      age: age ?? this.age,
      transactionDetails: transactionDetails ?? this.transactionDetails,
    );
  }
}
