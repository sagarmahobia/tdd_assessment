class StringCalculator {
  int add(String number) {
    if (number.isEmpty) {
      return 0;
    }

    var delimiter = RegExp(r',|\n');

    if (number.startsWith('//')) {
      final newlineIndex = number.indexOf('\n');
      if (newlineIndex != -1) {
        delimiter = RegExp(
          "${RegExp.escape(number.substring(2, newlineIndex))}|\n",
        );
        number = number.substring(newlineIndex + 1);
      }
    }

    var allNumbers = number.split(delimiter).map((e) => int.parse(e));

    var negativeNumbers = [];

    var total = 0;
    for (int number in allNumbers) {
      if (number > 0) {
        total = total + number;
      } else {
        negativeNumbers.add(number);
      }
    }

    if (negativeNumbers.isNotEmpty) {
      throw FormatException(
        "negative numbers not allowed ${negativeNumbers.join(", ")}",
      );
    } else {
      return total;
    }
  }
}
