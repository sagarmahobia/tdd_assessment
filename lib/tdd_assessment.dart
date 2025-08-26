class StringCalculator {
  int add(String number) {
    if (number.isEmpty) {
      return 0;
    }

    var total = number
        .split(',')
        .map((e) => int.parse(e))
        .fold(0, (e, i) => e + i);

    return total;
  }
}
