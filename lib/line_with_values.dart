import 'package:bar_creation/bloc/line_values_bloc.dart';
import 'package:bar_creation/line_with_values_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LineWithValues extends StatefulWidget {
  @override
  State<LineWithValues> createState() => _LineWithValuesState();
}

class _LineWithValuesState extends State<LineWithValues> {
  @override
  void initState() {
    BlocProvider.of<LineWithValuesBloc>(context)
        .add(UpdateValuesEvent(97.50, 102, 98, 103, 99));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250.0,
        height: 4.0,
        child: BlocBuilder<LineWithValuesBloc, LineWithValuesState>(
            builder: (context, state) {
          if (state is LineWithValuesUpdated) {
            return CustomPaint(
              painter: LineWithValuesPainter(
                  state.minValue,
                  state.maxValue,
                  state.pointer,
                  state.firstLineMinValue,
                  state.firstLineMaxValue),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
