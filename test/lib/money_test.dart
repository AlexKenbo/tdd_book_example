import 'package:tdd_book_example/bank.dart';
import 'package:tdd_book_example/expression.dart';
import 'package:tdd_book_example/money.dart';
import 'package:tdd_book_example/sum.dart';
import 'package:test/test.dart';


void main() {
  Money five;

  setUp((){   
    five = Money.dollar(5);
  });
  test('moneyMultiplication', () async {
    expect(five.times(2).equals(Money.dollar(10)), true);
    expect(five.times(3).equals(Money.dollar(15)), true);
  });

  test('equalityMoney', (){
    expect(Money.dollar(5).equals(Money.dollar(5)), true);
    expect(Money.dollar(5).equals(Money.dollar(6)), false);
    expect(Money.franc(5).equals(Money.dollar(5)), false);
  });

  test('should method currency() return string currency (USD, CHF)', (){
    expect(Money.dollar(15).currencyId(), "USD");
    expect(Money.franc(15).currencyId(), "CHF");
  });

  /*test('должен вернуть сумму сложения долларов', (){
    Sum sum = Money.dollar(5).plus(Money.dollar(5));
    expect(Money.dollar(10), sum);
  });
  */

  test('должен вернуть конвертированную сумму', (){
    Expression sum = five.plus(five);
    Bank bank = Bank();
    Money reduced = bank.reduce(sum, 'USD');
    expect(Money.dollar(10), reduced);
  });

  test('plus должен возвращать Sum', (){
    Sum sum = five.plus(five);
    expect(five, sum.augend);
    expect(five, sum.addend);
  });

  test(
    'должен вернуть Money если 2 валюты совпадают ',
    () async {
      //arrange
      Expression sum = Sum(Money.dollar(3), Money.dollar(4));
      Bank bank = Bank();
      bank.addRate('CHF', 'USD', 2);
      //act
      Money result = bank.reduce(sum, 'USD');
      //assert
      expect(Money.dollar(7), result);
    },
  );

  test(
    'reduce должен возвращать Money если на входе Money',
    () async {
      //arrange
      Bank bank = Bank();
      bank.addRate('CHF', 'USD', 2);
      //act
      Money result = bank.reduce(Money.dollar(7), 'USD');
      //assert
      expect(Money.dollar(7), result);
    },
  );

  test(
    '5\$ + 10CHF должно вернуть 10\$ ',
    () async {
      //arrange
      Expression fiveBucks = Money.dollar(5);
      Expression tenFrancs = Money.franc(10);
      Bank bank = Bank();
      //act
      bank.addRate('CHF', 'USD', 2);
      Money result = bank.reduce(fiveBucks.plus(tenFrancs), 'USD');
      //assert
      expect(Money.dollar(10), result);
    },
  );

  test(
    'reduce должен вернуть 1 USD если на входе 2 CHF',
    () async {
      //arrange
      Bank bank = Bank();
      bank.addRate('CHF', 'USD', 2);
      //act
      Money result = bank.reduce(Money.franc(2), 'USD');
      //assert
      expect(Money.dollar(1), result);
      
    },
  );

  test(
    'при обмене usd на usd rate должен выводить 1',
    () async {
      //assert
      expect(1, Bank().rate('USD', 'USD'));

    },
  );

  test(
    'SumPlusMoney ',
    () async {
      //arrange
      Expression fiveBucks = Money.dollar(5);
      Expression tenFrancs = Money.franc(10);
      Bank bank = Bank();
      //act
      bank.addRate('CHF', 'USD', 2);
      Expression sum = Sum(fiveBucks, tenFrancs).plus(fiveBucks);
      Money result = bank.reduce(sum, 'USD');
      //assert
      expect(Money.dollar(15), result);
    },
  );

    test(
    'SumTimes ',
    () async {
      //arrange
      Expression fiveBucks = Money.dollar(5);
      Expression tenFrancs = Money.franc(10);
      Bank bank = Bank();
      //act
      bank.addRate('CHF', 'USD', 2);
      Expression sum = Sum(fiveBucks, tenFrancs).times(2);
      Money result = bank.reduce(sum, 'USD');
      //assert
      expect(Money.dollar(20), result);
    },
  );

  test(
    'PlusSameCurrencyReturnsMoney ',
    () async {
      //arrange
      Money sum = Money.dollar(1).plus(Money.dollar(1));
      //act
      expect(sum.runtimeType, Money);
      //assert
      
    },
  );
  //TODO $5 + 10 CHF = $10, если курс 2:1
  //// Сделать amount закрытым членом класса
  //// Побочные эффекты в классе
  //// $5 * 2 = $10 
  //TODO округление денежных величин
  //// equals()
  //TODO hashCode()
  //TODO равенство значений null
  //TODO равенство объектов
  //// 5 CHF * 2 = 10 CHF
  //TODO Дублирование factory dollar/franc
  //// Общие операции equals()
  //TODO общие операции times()
  //// Сравнение Framc и Dollar
  //// Валюта?
  //todo Нужен ли тест francMultiplication()?
}