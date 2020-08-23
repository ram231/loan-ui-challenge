import 'package:meta/meta.dart';

@immutable
abstract class Auth {
  const Auth();
  factory Auth.fromJson(Map<String, dynamic> json) => null;
  Map<String, dynamic> toJson();
}
