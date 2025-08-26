class StringCalculator {
  int add(String number) {
    if (number.isEmpty) {
      return 0;
    }

    var allNumbers = number.split(',').map((e) => int.parse(e));

    var negativeNumbers = [];

    var total = 0;
    for (int number in allNumbers) {
      if (number > 0) {
        total = total + number;
      } else {
        negativeNumbers.add(number);
      }
    }

    if(negativeNumbers.isNotEmpty){
    
      throw FormatException("negative numbers not allowed ${negativeNumbers.join(", ")}");
    }else{
      return total;
    }
  }
}
