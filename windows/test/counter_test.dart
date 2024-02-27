import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertestexample/counter.dart';

main() {

  //setup = called when running testcase 1by1
  //setupall = first 
  //teardown = called after every test case
  //teardownall = last

  group('Counter class: ', () { 

  late Counter counter;
  setUp(() => counter = Counter()); //setup

  test('Given Counter class, when instantiated, then count = 0', () {
    //arrange
    //act
    int count = counter.count;
    //assert
    expect(count, 0);
  });

  test('Given Counter class, when incrementCount is called, then count = 1',
      () {
    //arange

    //act
    counter.incrementCount();
    //assert
    expect(counter.count, 1 );
  });

test('Given Counter class, when incrementCount is called 4 times, then count increases to 1, 3, 6, and 10',
      () {
    //arange

    //act
    counter.incrementCount();
    //assert
    expect(counter.count, 1 );
    counter.incrementCount();
    expect(counter.count, 3 );
    counter.incrementCount();
    expect(counter.count, 6 );
    counter.incrementCount();
    expect(counter.count, 10 );
  });

  test(
      'Given Counter class is instantiated, when decrementCount is called, then count = 0',
      () {
    //arrange

    //act
    counter.decrementCount();
    //assert
    expect(counter.count, 0);
  });

  test('Given Counter class is instantiated, when incrementCount and resetCount is called, then count = 0', (){

    counter.incrementCount();
    counter.resetCount();
    expect(counter.count, 0);
    
  });



});
}
