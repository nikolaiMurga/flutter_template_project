extension StringExtensions on String {
  bool isEmail() {
    final RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    return regex.hasMatch(this);
  }
}

extension DateExtension on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isThisWeek {
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return isAfter(weekAgo);
  }

  int get fullYears {
    final now = DateTime.now();
    int age = now.year - year;
    if (month > now.month) {
      age--;
    } else if (month == now.month && day > now.day) {
      age--;
    }
    return age;
  }
}
