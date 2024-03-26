import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/core/ext/timeofday_ext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MetaDateTime {
  String getDate(String? date, {String format = 'MM/dd/yyyy'}) {
    if (date == null) {
      return "";
    }

    DateTime parseDate;
    try {
      // parseDate =   DateFormat("dd MMM yyyy hh:mm").parse(date);
      try {
        parseDate = DateFormat("yyyy-MM-ddThh:mm:ss").parse(date);
      } catch (e) {
        parseDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
      }
    } catch (e) {
      parseDate = DateFormat("dd/MM/yyyy").parse(date);
    }

    final DateFormat formatter = DateFormat(format);
    final String formatted =
        formatter.format(DateTime.parse(parseDate.toString()));

    return formatted;
  }

  int getCurrentYear() {
    return DateTime.now().year;
  }

  int getCurrentMonth() {
    return DateTime.now().month;
  }

  DateTime getDateOnly(String date) {
    date = date.replaceAll(".", "-");
    print(date);
    DateTime parseDate = DateFormat("yyyy-MM-dd").parse(date);

    return parseDate;
  }

  DateTime getDateTime(String date) {
    DateTime parseDate;

    date = date.replaceAll(".", "-");
    print("date input");
    print(date);
    // parseDate =   DateFormat("dd MMM yyyy hh:mm").parse(date);
    try {
      parseDate = DateFormat("yyyy-MM-ddThh:mm:ss").parse(date);
    } catch (e) {
      try {
        parseDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
      } catch (e) {
        parseDate = DateFormat("yyyy-MM-dd hh:mm a").parse(date);
      }
    }

    return parseDate;
  }

  String getTime(String date) {
    DateTime dateTime;
    try {
      dateTime = DateTime.parse(date);
      return DateFormat.Hm().format(dateTime).toString(); //5:08 PM
    } catch (e) {
      return date;
    }
  }

  TimeOfDay stringToTimeOfDay(String tod) {
    final format = DateFormat.jm(); //"6:00 AM"
    return TimeOfDay.fromDateTime(format.parse(tod));
  }

  showTTimePicker({Function? onSelected}) async {
    TimeOfDay? picked = await showTimePicker(
      context: globalContext,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: MetaColors().primaryColor, // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // button text color
                  ),
                ),
              ),
              child: child!,
            ));
      },
    );
    if (picked != null) {
      onSelected!(picked.toStringFormat);
    }
  }

  setDateTime({Function? onSelected}) async {
    DateTime? pickedDate = await showDatePicker(
      context: appNavigatorKey.currentState!.context,
      initialDate: DateTime.now(), //get today's date
      firstDate: DateFormat("dd-MM-yyyy").parse(
          "01-01-1900"), //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: MetaColors().primaryColor, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      String _date = DateFormat('dd-MM-yyyy').format(pickedDate);

      onSelected!(_date);
    }
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  String timeAgo(DateTime d) {
    String ago = "ago".tr();
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year".tr() : "years"} $ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month".tr() : "months"} $ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week".tr() : "weeks".tr()} $ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "day".tr() : "days".tr()} $ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour".tr() : "hours".tr()} $ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute".tr() : "minutes".tr()} $ago";
    }
    return "justNow".tr();
  }
}
