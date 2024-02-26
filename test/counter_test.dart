import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertestexample/counter.dart';


main() {
  test('Given Counter class, when instantiated, then count = 0', (){
    //arrange
    Counter counter;
    //act
    counter = Counter();
    int count = counter.count;
    //assert
    expect(count, 0);
  });

  test('Given Counter class, when incrementCount is called, then count = 1', (){
    //arange
    Counter counter = Counter();
    //act
    counter.incrementCount();
    //assert
    expect(counter.count, 1);

  });
}