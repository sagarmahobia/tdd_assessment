class StringCalculator {
  int add(String number) {
    if (number.isEmpty) {
      return 0;
    } else {
      return int.parse(number);
    }
  }
}
