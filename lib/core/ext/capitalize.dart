import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return "";
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String convertToTitleCase() {
    if (length <= 1) {
      return toUpperCase();
    }

    // Split string into multiple words
    final List<String> words = split(' ');

    // Capitalize first letter of each words
    final capitalizedWords = words.map((word) {
      if (word.trim().isNotEmpty) {
        final String firstLetter = word.trim().substring(0, 1).toUpperCase();
        final String remainingLetters = word.trim().substring(1);

        return '$firstLetter$remainingLetters';
      }
      return '';
    });

    // Join/Merge all words back to one String
    return capitalizedWords.join(' ');
  }
}

extension LowerCaseList on List<String> {
  void toLowerCase() {
    for (int i = 0; i < length; i++) {
      this[i] = this[i].toLowerCase();
    }
  }
}

extension NullableStringExtension on String? {
  String handleNullValue() {
    return this == null || this == ""
        ? "Not Mentioned"
        : (this ?? "Not Mentioned");
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension RupeesFormatter on String {
  String inRupeesFormat() {
    if (this.isEmpty) {
      return "0";
    }

    double amount = 0;
    try {
      amount = double.parse(this);
    } catch (e) {
      //  print("RupeesFormatter ERROR "+e.toString());
      return "0";
    }

    return NumberFormat.currency(
      name: "INR",
      locale: 'en_IN',
      decimalDigits: 0, // change it to get decimal places
      symbol: ' ',
    ).format(amount);
  }
}
