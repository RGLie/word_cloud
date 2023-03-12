import 'package:flutter/material.dart';

class WordCloud extends StatefulWidget {
  const WordCloud({super.key});

  @override
  State<WordCloud> createState() => _WordCloudState();
}

class _WordCloudState extends State<WordCloud> {
  List<dynamic> word_list = [
    {'word': 'Apple', 'value': 80},
    {'word': 'Samsung', 'value': 60},
    {'word': 'Intel', 'value': 37},
    {'word': 'Tesla', 'value': 44},
    {'word': 'AMD', 'value': 26},
    {'word': 'Google', 'value': 35},
    {'word': 'Qualcom', 'value': 25},
    {'word': 'Netflix', 'value': 14},
    {'word': 'Meta', 'value': 32},
    {'word': 'Amazon', 'value': 18},
    {'word': 'Nvidia', 'value': 13},
    {'word': 'Microsoft', 'value': 31},
    {'word': 'TSMC', 'value': 27},
    {'word': 'PayPal', 'value': 24},
    {'word': 'AT&T', 'value': 10},
    {'word': 'Oracle', 'value': 16},
    {'word': 'Unity', 'value': 13},
    {'word': 'Roblox', 'value': 10},
    {'word': 'Lucid', 'value': 5},
    {'word': 'Naver', 'value': 5},
    {'word': 'Kakao', 'value': 5},
    {'word': 'NC Soft', 'value': 5},
    {'word': 'LG', 'value': 5},
    {'word': 'Hyundai', 'value': 5},
    {'word': 'KIA', 'value': 5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.indigoAccent,
          child: CustomPaint(
            painter: _paint(wordlist: word_list),
            // painter: Sky(),
            // child: Text('Once upon a time...'),
            // foregroundPainter: Ground(),
          ),
        ),
      ),
    );
  }
}

class _paint extends CustomPainter {
  final List<dynamic> wordlist;
  _paint({
    required this.wordlist,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double mapX = 300;
    double mapY = 300;
    List map = [[]];

    for (var i = 0; i < mapX; i++) {
      for (var j = 0; j < mapY; j++) {
        map[i].add(0);
      }
      map.add([]);
    }

    Paint paint = Paint()
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..color = Colors.black;

    Path path = Path()
      ..moveTo(50, 50)
      ..lineTo(100, 100);

    for (var i = 0; i < wordlist.length; i++) {
      final textSpan = TextSpan(
        text: wordlist[i]['word'],
        style: TextStyle(color: Colors.black, fontSize: wordlist[i]['value']),
      );

      final textPainter = TextPainter()
        ..text = textSpan
        ..textDirection = TextDirection.ltr
        ..textAlign = TextAlign.center
        ..layout();

      double startX = 0;
      double startY = 0;
      Offset startOffset = Offset(startX, startY);

      final xCenter = (100 - textPainter.width / 2);
      final yCenter = (100 - textPainter.height / 2);
      final offset = Offset(xCenter, yCenter);

      //textPainter.paint(canvas, Offset(textPainter.width, textPainter.height));
      //textPainter.paint(canvas, offset);
      textPainter.paint(canvas, startOffset);
    }

    // canvas.save();
    // canvas.translate(textCentre.dx, textCentre.dy);
    // canvas.rotate(theta);
    // canvas.translate(-textCentre.dx, -textCentre.dy);
    // textPainter.paint(canvas, delta);
    // canvas.restore();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
