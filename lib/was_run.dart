import 'package:tdd_book_example/test_case.dart';

class WasRun extends TestCase {
  bool wasRun = false;
  String testName;
  String log;
  //int count = 0;

  WasRun(testName) : super(testName);

  //void increment() => count++;

  void testMethod(){
    wasRun = true;
    log = '${log}testMethod ';
  }

  void setUp(){
    log = 'setUp ';
  }

  void tearDown(){
    log = '${log}tearDown ';
  }

  void run() {
    setUp();
    testMethod();
    tearDown();
  }

}