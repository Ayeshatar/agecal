import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_machine/time_machine.dart';
import 'package:jiffy/jiffy.dart';

class HomeController extends GetxController {
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final RxString ageYears = "0".obs;
  final RxString ageMonths = "0".obs;
  final RxString ageDays = "0".obs;
  final RxString ageInMonths = "0".obs;
  final RxString ageInDays = "0".obs;
  final RxString ageInWeeks = "0".obs;
  final RxString ageInHours = "0".obs;
  final RxString ageInMinutes = "0".obs;
  final RxString ageInSeconds = "0".obs;
  final RxString nextBirthdayMonth = "0".obs;
  final RxString nextBirthdayDate = "0".obs;

  void calculateAge() {
    if (selectedDate.value != null) {
      LocalDateTime now = LocalDateTime.now();

      final birthdate = LocalDate(
        selectedDate.value!.year,
        selectedDate.value!.month,
        selectedDate.value!.day,
      );

      // LocalDate nextBirthday = LocalDate(now.year, birthdate.month, birthdate.day);
      //
      // if (nextBirthday < now) {
      //
      //   nextBirthday = nextBirthday.add(Period(years: 1));
      // }
      //
      // Period difference = now.periodUntil(nextBirthday as LocalDateTime);
      //
      // int remainingDays = difference.days;
      // int remainingMonths = difference.months;
      //
      // // LocalDate nextBirthday = LocalDate(now.year, birthdate.monthOfYear, birthdate.dayOfMonth);
      // // final nextBirthdayYear = now.year + 1;
      // // final remainingMonths = (nextBirthday.year - now.year) * 12 + nextBirthday.monthOfYear - now.monthOfYear;
      // // final remainingDays = LocalDate.difference(now.add(Duration(days: int.parse(ageInDays.value)))).inDays;
      // //
      // //
      // // Period difference = now.periodUntil(nextBirthday as LocalDateTime);
      // //
      DateDuration duration= AgeCalculator.timeToNextBirthday(selectedDate.value!);
      nextBirthdayMonth.value = duration.months.toString();
      nextBirthdayDate.value = duration.days.toString();

      LocalDateTime dob = LocalDateTime.dateTime(selectedDate.value!);
      Period diff = now.periodSince(dob);
      ageYears.value = diff.years.toString();
      ageMonths.value = diff.months.toString();
      ageDays.value = diff.days.toString();
      ageInDays.value = convertDiff(Unit.day);
      ageInMonths.value = convertDiff(Unit.month);
      ageInWeeks.value = convertDiff(Unit.week);
      ageInHours.value = convertDiff(Unit.hour);
      ageInMinutes.value = convertDiff(Unit.minute);
      ageInSeconds.value = convertDiff(Unit.second);

      print(Jiffy.parse("2018/01/29")
          .diff(Jiffy.parse("1994/01/17"), unit: Unit.month)
          .toString());
    }
  }

  static int daysDifferenceBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static int minutesBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inMinutes).round();
  }

  static int secondsBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inSeconds).round();
  }

  static int hoursBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours).round();
  }

  String convertDiff(Unit unit) {
    DateFormat dateFormat = DateFormat("yyyy/MM/dd");
    return Jiffy.parse(dateFormat.format(DateTime.now()))
        .diff(Jiffy.parse(dateFormat.format(selectedDate.value!)), unit: unit)
        .toString();
  }
}
