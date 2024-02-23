import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_tutorial/cubit/counter_cubit_state.dart';

/*
>>  CounterCubit class that extends the Cubit class from the flutter_bloc package.
    The Cubit class is a state management solution that simplifies the way of emitting states.
    It is a subset of the famous implementation of the BLoC pattern and does not rely on events,
    instead, it uses methods to emit new states.
 */

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit() : super(CounterInitiate());

  int counter = 0;
  void increment() {
    counter++;
    emit(CounterValueUpdated(counter: counter));
  }

  void decrement(){
    counter--;
    emit(CounterValueUpdated(counter: counter));
  }

}