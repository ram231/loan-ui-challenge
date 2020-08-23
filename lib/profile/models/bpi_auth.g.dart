// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpi_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BpiAuth _$BpiAuthFromJson(Map json) {
  return BpiAuth(
    clientId: json['clientId'] as String,
    clientSecret: json['clientSecret'] as String,
    code: json['code'] as String,
    tokenType: json['tokenType'] as String,
    accesstoken: json['accesstoken'] as String,
    expiresIn: json['expiresIn'] as int,
    scope: json['scope'] as String,
    refreshToken: json['refreshToken'] as String,
    originalUrl: json['originalUrl'] as String,
    grantType: _$enumDecodeNullable(_$BpiGrantTypeEnumMap, json['grantType']),
  );
}

Map<String, dynamic> _$BpiAuthToJson(BpiAuth instance) => <String, dynamic>{
      'clientId': instance.clientId,
      'clientSecret': instance.clientSecret,
      'code': instance.code,
      'tokenType': instance.tokenType,
      'accesstoken': instance.accesstoken,
      'expiresIn': instance.expiresIn,
      'scope': instance.scope,
      'refreshToken': instance.refreshToken,
      'originalUrl': instance.originalUrl,
      'grantType': _$BpiGrantTypeEnumMap[instance.grantType],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$BpiGrantTypeEnumMap = {
  BpiGrantType.authorizationCode: 'authorizationCode',
  BpiGrantType.password: 'password',
  BpiGrantType.clientCredentials: 'clientCredentials',
  BpiGrantType.refreshToken: 'refreshToken',
};
