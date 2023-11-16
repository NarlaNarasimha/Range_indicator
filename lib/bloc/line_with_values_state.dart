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