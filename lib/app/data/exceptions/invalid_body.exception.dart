import 'package:logger/logger.dart';

class InvalidBodyException implements Exception {
  final String message;
  InvalidBodyException({
    this.message = 'Invalid parameters received!',
  }) {
    Logger().w(message);
  }

  @override
  String toString() => message;
}
