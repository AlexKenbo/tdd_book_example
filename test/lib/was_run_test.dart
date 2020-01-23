import 'package:tdd_book_example/test_case.dart';
import 'package:tdd_book_example/was_run.dart';
import 'package:test/test.dart';

void main() {
  WasRun testOne;
  setUp((){    
    testOne = WasRun('testMethod');
  });
  test(
    'should return true',
    () async {
      //arrange
      
      //act
      expect(testOne.wasRun, false);
      testOne.run();
      //assert
      expect(testOne.wasRun, true);
    },
  );

  test(
    'should SetUp',
    () async {
      //arrange
      //act
      testOne.run();
      //assert
      //print(testOne.log);
      expect(testOne.log, 'setUp testMethod tearDown ');
    },
  );

}