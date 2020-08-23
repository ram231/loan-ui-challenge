import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'auth.dart';
part 'bpi_auth.g.dart';

enum BpiGrantType {
  authorizationCode,
  password,
  clientCredentials,
  refreshToken
}

@JsonSerializable(anyMap: true, explicitToJson: true)
class BpiAuth extends Auth with EquatableMixin {
  final String clientId;
  final String clientSecret;
  final String code;
  final String tokenType;
  final String accesstoken;
  final int expiresIn;
  final String scope;
  final String refreshToken;
  final String originalUrl;
  final BpiGrantType grantType;
  BpiAuth({
    this.clientId,
    this.clientSecret,
    this.code,
    this.tokenType,
    this.accesstoken,
    this.expiresIn,
    this.scope,
    this.refreshToken,
    this.originalUrl,
    this.grantType,
  });

  BpiAuth copyWith({
    String clientId,
    String clientSecret,
    String code,
    String tokenType,
    String accesstoken,
    int expiresIn,
    String scope,
    String refreshToken,
    String originalUrl,
    BpiGrantType grantType,
  }) {
    return BpiAuth(
      clientId: clientId ?? this.clientId,
      clientSecret: clientSecret ?? this.clientSecret,
      code: code ?? this.code,
      tokenType: tokenType ?? this.tokenType,
      accesstoken: accesstoken ?? this.accesstoken,
      expiresIn: expiresIn ?? this.expiresIn,
      scope: scope ?? this.scope,
      refreshToken: refreshToken ?? this.refreshToken,
      originalUrl: originalUrl ?? this.originalUrl,
      grantType: grantType ?? this.grantType,
    );
  }

  @override
  factory BpiAuth.fromJson(Map<String, dynamic> json) =>
      _$BpiAuthFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BpiAuthToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      clientId,
      clientSecret,
      code,
      tokenType,
      accesstoken,
      expiresIn,
      scope,
      refreshToken,
      originalUrl,
      grantType,
    ];
  }
}
