import 'package:flutter/material.dart';

class WordCloud extends StatefulWidget {
  const WordCloud({super.key});

  @override
  State<WordCloud> createState() => _WordCloudState();
}

class _WordCloudState extends State<WordCloud> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: _paint(),
            // painter: Sky(),
            // child: Text('Once upon a time...'),
            // foregroundPainter: Ground(),
          ),
        )
      ],
    );
  }
}

class _paint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.black;
      
     Path path = Path()
      ..moveTo(0, 50)
      ..lineTo(0, 100);
      
     canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}