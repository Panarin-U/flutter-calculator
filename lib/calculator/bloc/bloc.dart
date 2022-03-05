


import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {

  CalculatorBloc() : super(CalculatorState()) {
    on<CalculatorEvent>((event, emit) => onCalculatorEvent(event, emit));
  }

  void onCalculatorEvent(CalculatorEvent event, Emitter<CalculatorState> emit) {
    state.applyCommand(event.command);
    return emit(state);
  }

}