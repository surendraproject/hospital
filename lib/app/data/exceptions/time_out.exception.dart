import 'package:logger/logger.dart';

class TimeOutException implements Exception {
  final String message;
  TimeOutException({
    this.message = 'Request timeout occurred!',
  }) {
    Logger().w(message);
  }

  @override
  String toString() => message;
}