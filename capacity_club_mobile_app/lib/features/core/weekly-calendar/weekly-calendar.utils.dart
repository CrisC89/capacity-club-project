class WeeklyCalendarUtils {
  WeeklyCalendarUtils._();
  static String dayOfWeek(int index) {
    String day;
    switch (index) {
      case 1:
        day = 'LUN';
        break;
      case 2:
        day = 'MAR';
        break;
      case 3:
        day = 'MER';
        break;
      case 4:
        day = 'JEU';
        break;
      case 5:
        day = 'VEN';
        break;
      case 6:
        day = 'SAM';
        break;
      case 7:
        day = 'DIM';
        break;
      default:
        day = '';
    }

    return day;
  }

  static String monthOfYear(int index) {
    String month;

    switch (index) {
      case 1:
        month = 'Janvier';
        break;
      case 2:
        month = 'Février';
        break;
      case 3:
        month = 'Mars';
        break;
      case 4:
        month = 'Avril';
        break;
      case 5:
        month = 'Mai';
        break;
      case 6:
        month = 'Juin';
        break;
      case 7:
        month = 'Juillet';
        break;
      case 8:
        month = 'Août';
        break;
      case 9:
        month = 'Septembre';
        break;
      case 10:
        month = 'Octobre';
        break;
      case 11:
        month = 'Novembre';
        break;
      case 12:
        month = 'Décembre';
        break;
      default:
        month = '';
    }

    return month;
  }

  static List<DateTime> generateDaysOfWeek(DateTime currentWeekFirstDay) {
    final List<DateTime> currentWeek = List.generate(
        7,
        (i) => currentWeekFirstDay
            .add(Duration(days: i - currentWeekFirstDay.weekday + 1)));

    return currentWeek;
  }

  static DateTime generateFirstDayOfWeek(DateTime currentDay) {
    final firstDay =
        currentDay.subtract(Duration(days: currentDay.weekday - 1));
    return DateTime(firstDay.year, firstDay.month, firstDay.day);
  }
}
