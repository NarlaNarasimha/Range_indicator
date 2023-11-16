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