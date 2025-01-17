import 'package:logger/logger.dart';

class DefaultException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  DefaultException({
    this.message = 'Error loading data, please try again later!',
    this.stackTrace,
  }) {
    Logger().e(message, stackTrace: stackTrace);
  }

  @override
  String toString() => message;
}