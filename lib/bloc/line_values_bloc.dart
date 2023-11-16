import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LineWithValuesEvent {}

class UpdateValuesEvent extends LineWithValuesEvent {
  final double firstLineMinValue;
  final double firstLineMaxValue;
  double minValue;
  double maxValue;
  double pointer;

  UpdateValuesEvent(
       this.firstLineMinValue,
       this.firstLineMaxValue,
       this.minValue,
       this.maxValue,
       this.pointer);
}
//state
abstract class LineWithValuesState {}

class IntialUpdate extends LineWithValuesState {}

class LineWithValuesUpdated extends LineWithValuesState {
  final double firstLineMinValue;
  final double firstLineMaxValue;
  double minValue;
  double maxValue;
  double pointer;

  LineWithValuesUpdated(
      this.firstLineMinValue,
       this.firstLineMaxValue,
       this.minValue,
       this.maxValue,
       this.pointer);
}

class LineWithValuesBloc
    extends Bloc<LineWithValuesEvent, LineWithValuesState> {
    LineWithValuesBloc() : super(IntialUpdate()) {
  on<UpdateValuesEvent>(onUpdate);
  }

  void onUpdate(UpdateValuesEvent event, Emitter<LineWithValuesState> emit) async {
  
      double minValue = event.minValue;
      double maxValue = event.maxValue;
      double pointer = event.pointer;

      if (pointer < minValue) {
        pointer = minValue;
      } else if (pointer > maxValue) {
        pointer = maxValue;
      }

      if (minValue < event.firstLineMinValue &&
          maxValue > event.firstLineMaxValue) {
        maxValue = event.firstLineMaxValue;
        minValue = event.firstLineMinValue;
      }
      if (minValue < event.firstLineMinValue || minValue > maxValue) {
        minValue = event.firstLineMinValue;
      }
      if (maxValue > event.firstLineMaxValue || maxValue < minValue) {
        maxValue = event.firstLineMaxValue;
      }

      // Yield the updated state
      emit(LineWithValuesUpdated(
        event.firstLineMinValue,
        event.firstLineMaxValue,
        minValue,
        maxValue,
        pointer,
      ));
    }
  }

    
