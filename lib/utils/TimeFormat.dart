class TimeFormat {
  String str;
  TimeFormat.toDateTime(DateTime time) {
    str =
        "${time.year.toString()}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')} ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  TimeFormat.toChDateTime(DateTime time) {
    str =
        "${time.year.toString()}年${time.month.toString().padLeft(2, '0')}月${time.day.toString().padLeft(2, '0')}日 ${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  TimeFormat.toDate(DateTime time) {
    str =
        "${time.year.toString()}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}";
  }

  TimeFormat.toChDate(DateTime time) {
    str =
        "${time.year.toString()}年${time.month.toString().padLeft(2, '0')}月${time.day.toString().padLeft(2, '0')}日";
  }
}
