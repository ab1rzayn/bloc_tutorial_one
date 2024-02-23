import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_tutorial/cubit/counter_cubit.dart';
import 'package:bloc_tutorial/cubit/counter_cubit_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const textStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
      fontFamily: "Andika"
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Cubit Counter App"),
        ),
        /*
        BlocBuilder:
        ** It takes two type parameters: the first one is the CounterCubit class (from which it reads state),
        ** and the second one is the type of state (CounterCubitState).
        ** It has a builder function that is called whenever the state changes.
        ** This function takes the current BuildContext and the current state as arguments.
         */
        body: BlocBuilder<CounterCubit, CounterCubitState>(
            builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /*
                **  Checks if the current state (state) is an instance of CounterValueUpdated class
                **  If the condition (state is CounterValueUpdated) is true .
                **  It creates a Text widget displaying the current counter value (state.counter.toString())
                **  using the TextStyle specified by the textStyle variable.
                *
                */

                (state is CounterValueUpdated)
                    ? Text(state.counter.toString(), style: textStyle,)
                    :  Text("0", style: textStyle,),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterCubit>().increment();
                        },
                        child: const Icon(Icons.add),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          context.read<CounterCubit>().decrement();
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ])
              ],
            ),
          );
          }
        )
    );
  }
}
