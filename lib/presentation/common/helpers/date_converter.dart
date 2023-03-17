import 'package:intl/intl.dart';

mixin DateConverter {
  String dateToText(DateTime? date) {
    if (date == null) return '';
    final formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(date);
  }

  String dateToTextMMMM(DateTime? date) {
    if (date == null) return '';
    final formatter = DateFormat('dd MMMM yyyy', 'ru');
    return formatter.format(date);
  }

  String? dateToApiText(DateTime? date) {
    if (date == null) return null;
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  DateTime textToDate(String text) {
    try {
      final date = DateTime.parse(text);
      return date;
    } catch (e) {
      return DateTime.now();
    }
  }

  String years(String age) {
    final years = int.parse(age);
    final rem = years % 10;
    if (rem == 1) {
      return 'год';
    } else if (rem == 2 || rem == 3 || rem == 4) {
      return 'года';
    } else {
      return 'лет';
    }
  }

  String participant(int length) {
    final rem = length % 10;
    if (rem == 1) {
      return 'участник';
    } else if (rem == 2 || rem == 3 || rem == 4) {
      return 'участника';
    } else {
      return 'участников';
    }
  }
}
