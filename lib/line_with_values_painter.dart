import 'package:flutter/material.dart';

class LineWithValuesPainter extends CustomPainter {
  final double minValue;
  final double maxValue;
  final double pointerValue;
  final double firstLineMinValue;
  final double firstLineMaxValue;

  LineWithValuesPainter(this.minValue, this.maxValue, this.pointerValue,
      this.firstLineMinValue, this.firstLineMaxValue);

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerLinePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 9.0
      ..strokeCap = StrokeCap.round;

    Offset startPoint = Offset(0.0, size.height / 2);
    Offset endPoint = Offset(size.width, size.height / 2);

    canvas.drawLine(startPoint, endPoint, outerLinePaint);

    double range = size.width / (firstLineMaxValue - firstLineMinValue);

    double minPosition = 0 + (minValue - firstLineMinValue) * range;
  
    double maxPosition = size.width - (firstLineMaxValue - maxValue) * range;

    // StrokeCap strokeCap = StrokeCap.butt;

    // if (minValue == firstLineMinValue && maxValue == firstLineMaxValue) {
    //     strokeCap = StrokeCap.round;
    // } else if (minValue == firstLineMinValue) {
    //     strokeCap = StrokeCap.round;
    // } else if (maxValue == firstLineMaxValue) {
    //     strokeCap = StrokeCap.round;
    // }
    
    Paint innerLinePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 9.0
      ..strokeCap = (minValue == firstLineMinValue || maxValue == firstLineMaxValue) ? StrokeCap.round : StrokeCap.butt;
    canvas.drawLine(
      Offset(minPosition, size.height / 2),
      Offset(maxPosition, size.height / 2),
      innerLinePaint,
    );

    TextPainter outerLineMinTextPainter = TextPainter(
      text: TextSpan(
        text: '$firstLineMinValue',
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );

    TextPainter outerLineMaxTextPainter = TextPainter(
      text: TextSpan(
        text: '$firstLineMaxValue',
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );

    outerLineMinTextPainter.layout();
    outerLineMaxTextPainter.layout();

    outerLineMinTextPainter.paint(
      canvas,
      Offset(0.0, size.height / 2 + 10),
    );

    outerLineMaxTextPainter.paint(
      canvas,
      Offset(size.width - 40, size.height / 2 + 10),
    );

    TextPainter minTextPainter = TextPainter(
      text: TextSpan(
        text: '$minValue',
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );

    TextPainter maxTextPainter = TextPainter(
      text: TextSpan(
        text: '$maxValue',
        style: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );

    minTextPainter.layout();
    maxTextPainter.layout();

    minTextPainter.paint(
      canvas,
      Offset(minPosition, size.height / 2 - 40),
    );

    maxTextPainter.paint(
      canvas,
      Offset(maxPosition - 40, size.height / 2 - 40),
    );

    double pointerPosition = 0 + (pointerValue - firstLineMinValue) * range;

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    Path trianglePath = Path();
    trianglePath.moveTo(pointerPosition, size.height / 2 + 5);
    trianglePath.lineTo(pointerPosition - 5, size.height / 2 + 15);
    trianglePath.lineTo(pointerPosition + 5, size.height / 2 + 15);

    canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
