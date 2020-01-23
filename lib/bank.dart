import 'package:tdd_book_example/pair.dart';

import 'expression.dart';
import 'money.dart';

class Bank {
  Map<dynamic, int> rates = {};

  void addRate(String from, String to, int rate) {
    rates.putIfAbsent(Pair(from,to), () => rate);
  }

  int rate(String from, String to) {
    if (from == to) return 1;
    int rate = rates[Pair(from,to)];
    print('Rate: $rate');
    return rate;
  } 

  Money reduce(Expression source, String to) {
    return source.reduce(this, to);
  }
}
