import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0)) {
    // IncrementEvent geldiğinde sayacı 1 artırır
    on<IncrementEvent>((event, emit) {
      emit(CounterInitial(state.count + 1));
    });

    // DecrementEvent geldiğinde sayacı 1 azaltır
    on<DecrementEvent>((event, emit) {
      emit(CounterInitial(state.count - 1));
    });
  }
}
