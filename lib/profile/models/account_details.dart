import 'package:equatable/equatable.dart';

enum CardType { credit, debit }
enum AccountType {
  savings,
  checking,
}

class AccountDetails extends Equatable {
  final TransactionType transactionType;
  final int accountNumber;
  final String token;
  final AccountType accountType;
  final DateTime expirationDate;
  final CardType cardType;
  final DateTime createdAt;
  final DateTime updatedAt;
  AccountDetails({
    this.transactionType,
    this.accountNumber,
    this.token,
    this.accountType,
    this.expirationDate,
    this.cardType,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object> get props {
    return [
      transactionType,
      accountNumber,
      expirationDate,
      cardType,
      createdAt,
      updatedAt,
    ];
  }

  AccountDetails copyWith({
    TransactionType transactionType,
    int accountNumber,
    DateTime expirationDate,
    CardType cardType,
    DateTime createdAt,
    DateTime updatedAt,
  }) {
    return AccountDetails(
      transactionType: transactionType ?? this.transactionType,
      accountNumber: accountNumber ?? this.accountNumber,
      expirationDate: expirationDate ?? this.expirationDate,
      cardType: cardType ?? this.cardType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

enum TransactionType {
  gcash,
  bpi,
  paymaya,
  bdo,
  rcbc,
}
