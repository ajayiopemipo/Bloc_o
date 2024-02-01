// Import necessary packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

// States
abstract class CounterState {}

class InitialCounterState extends CounterState {
  final int count;

  InitialCounterState(this.count);
}

// BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialCounterState(0));

  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield InitialCounterState((state as InitialCounterState).count + 1);
    } else if (event is DecrementEvent) {
      yield InitialCounterState((state as InitialCounterState).count - 1);
    }
  }
}