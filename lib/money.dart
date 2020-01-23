import 'package:equatable/equatable.dart';
import 'package:tdd_book_example/bank.dart';
import 'package:tdd_book_example/expression.dart';
import 'package:tdd_book_example/sum.dart';

class Money extends Equatable implements Expression {
  final int amount;
  final String currency;

  Money(this.amount, this.currency);

  bool equals(Money money) {
    return amount == money.amount && this.currencyId() == money.currencyId();
  }

  Expression times(int multiplier) {
    return Money(amount * multiplier, currency);
  }

  String currencyId() {
    return currency;
  }

  factory Money.dollar(int amount) {
    return Money(amount, 'USD');
  }

  factory Money.franc(int amount) {
    return Money(amount, 'CHF');
  }

  Expression plus(Expression addend) {
    return Sum(this, addend);
  }

  Money reduce(Bank bank, String to) {
    int rate = bank.rate(currency, to);
    //print('$amount/$rate');
    int newAmount = (amount/rate).toInt();
    //print('$newAmount');
    return Money(newAmount, to);
  }

  @override
  List<Object> get props => [amount, currency];
}
