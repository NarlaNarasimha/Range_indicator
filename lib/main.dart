import 'dart:ffi' as prefix;

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Range Indicator'),
        ),
        body: LineWithValues(minValue: 20.0,maxValue: 80.0,pointer: 50,),
      ),
    );
  }
}

class LineWithValues extends StatelessWidget {
  final double minValue;
  final double maxValue;
  double pointer;

  LineWithValues({required this.minValue, required this.maxValue, required this.pointer});

  @override
  Widget build(BuildContext context) { 
   
    return Center(
      child: Container(
        width: 250.0, 
        height: 4.0, 
        child: CustomPaint(
              painter: LineWithValuesPainter(minValue, maxValue, pointer),
            ),
        ),
        );
  }
}

class LineWithValuesPainter extends CustomPainter {
  final double minValue;
  final double maxValue;
  final double pointerValue;

  LineWithValuesPainter(this.minValue, this.maxValue, this.pointerValue);

  @override
  void paint(Canvas canvas, Size size) {
   
    Paint outerLinePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 9.0
      ..strokeCap = StrokeCap.round;

    Offset startPoint = Offset(0.0, size.height / 2);
    Offset endPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startPoint, endPoint, outerLinePaint);

    double minPosition = minValue;
    double maxPosition = maxValue;

    Paint innerLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 9.0;

    canvas.drawLine(
      Offset(minPosition, size.height / 2),
      Offset(maxPosition, size.height / 2),
      innerLinePaint,
    );

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    Path trianglePath = Path();
    trianglePath.moveTo(pointerValue, size.height / 2 + 10); 
    trianglePath.lineTo(pointerValue - 10, size.height / 2 + 20); 
    trianglePath.lineTo(pointerValue + 10, size.height / 2 + 20); 

    canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
