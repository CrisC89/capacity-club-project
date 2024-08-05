import 'package:capacity_club_mobile_app/core/config/theme/theme.dart';
import 'package:capacity_club_mobile_app/core/config/theme/theme_color.dart';
import 'package:flutter/material.dart';

Widget roundedProgressBar(double progress) {
  return Column(
    children: [
      SizedBox(height: 40),
      Text('Training Progress', style: AppTheme.mediumTitleTextStyle),
      SizedBox(height: 40),
      Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: ThemeColor.mainColor, // Couleur d'arrière-plan bleue
              shape: BoxShape.circle, // Forme circulaire
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: RoundedCircularProgressIndicator(
              value: progress,
              strokeWidth: 10,
              valueColor: Colors.white, // Couleur de la barre de progression
              backgroundColor: ThemeColor
                  .mainColor, // Couleur de fond bleue quand la barre n'est pas là
            ),
          ),
          Text(
            '${(progress * 100).toStringAsFixed(1)}%',
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Audiowide',
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
      SizedBox(height: 20),
    ],
  );
}

class RoundedCircularProgressIndicator extends StatelessWidget {
  final double value;
  final double strokeWidth;
  final Color backgroundColor;
  final Color valueColor;

  RoundedCircularProgressIndicator({
    required this.value,
    this.strokeWidth = 10.0,
    required this.backgroundColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(100.0),
      painter: _RoundedCircularProgressPainter(
        value: value,
        strokeWidth: strokeWidth,
        backgroundColor: backgroundColor,
        valueColor: valueColor,
      ),
    );
  }
}

class _RoundedCircularProgressPainter extends CustomPainter {
  final double value;
  final double strokeWidth;
  final Color backgroundColor;
  final Color valueColor;

  _RoundedCircularProgressPainter({
    required this.value,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.valueColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Paint valuePaint = Paint()
      ..color = valueColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double radius = (size.width / 2) - (strokeWidth / 2);
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Draw background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final double sweepAngle = 2 * 3.141592653589793 * value;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2,
      sweepAngle,
      false,
      valuePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
