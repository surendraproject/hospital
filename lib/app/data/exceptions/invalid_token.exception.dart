import 'package:logger/logger.dart';

class InvalidTokenException implements Exception {
  final String message;
  InvalidTokenException({this.message = 'Unautorized'}) {
    Logger().w(message);
  }

  @override
  String toString() => message;
}
