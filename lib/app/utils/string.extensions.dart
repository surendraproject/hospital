import 'package:intl/intl.dart';

extension StringExtension on String? {
  String formatToValid() {
    DateFormat parseFormat = DateFormat('yyyy-MM-dd');
    DateFormat convertFormat = DateFormat('MM/yy');
    if (this != null && this!.isNotEmpty) {
      try {
        DateTime dateTime = parseFormat.parse(this!);
        return convertFormat.format(dateTime);
      } catch (e) {
        return '';
      }
    }
    return '';
  }

  String toYears() {
    DateFormat parseFormat = DateFormat('yyyy-MM-dd');
    if (this != null && this!.isNotEmpty) {
      try {
        DateTime dateTime = parseFormat.parse(this!);
        return '${DateTime.now().year - dateTime.year}';
      } catch (e) {
        return '0';
      }
    }
    return '0';
  }

  double toDouble() {
    return double.tryParse(this ?? '0') ?? 0;
  }
}