import 'bank.dart';
import 'money.dart';

abstract class Expression {
  Money reduce(Bank bank, String to);
  Expression plus(Expression addend);
  Expression times(int multiplier);
  bool equals(Money money);
}