import 'package:equatable/equatable.dart';

/*
*** equatable in Flutter Cubit serves to simplify the process of determining
*   whether two instances of a class are equal without requiring explicit overrides of the ==
*/

abstract class CounterCubitState extends Equatable{
  const CounterCubitState();
}

class CounterInitiate extends CounterCubitState {
  @override
  List<Object> get props => [];
}
/*
** whenever the cubit checks for equality between two instances of CounterValueUpdated,
** it will only look at the counter property, ignoring any other fields that may exist in the class
 */

class CounterValueUpdated extends CounterCubitState {
  int counter;
  CounterValueUpdated({required this.counter});

  @override
  List<Object> get props => [counter];
}