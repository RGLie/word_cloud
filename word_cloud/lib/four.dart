import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud.dart';

class FourthWordCloud extends StatefulWidget {
  const FourthWordCloud({super.key});

  @override
  State<FourthWordCloud> createState() => _FourthWordCloudState();
}

class _FourthWordCloudState extends State<FourthWordCloud> {
  List<Map> word_list = [
    {'word': 'Apple', 'value': 100},
    {'word': 'Samsung', 'value': 60},
    {'word': 'Intel', 'value': 55},
    {'word': 'Tesla', 'value': 50},
    {'word': 'AMD', 'value': 40},
    {'word': 'Google', 'value': 35},
    {'word': 'Qualcom', 'value': 31},
    {'word': 'Netflix', 'value': 27},
    {'word': 'Meta', 'value': 27},
    {'word': 'Amazon', 'value': 26},
    {'word': 'Nvidia', 'value': 25},
    {'word': 'Microsoft', 'value': 25},
    {'word': 'TSMC', 'value': 24},
    {'word': 'PayPal', 'value': 24},
    {'word': 'AT&T', 'value': 24},
    {'word': 'Oracle', 'value': 23},
    {'word': 'Unity', 'value': 23},
    {'word': 'Roblox', 'value': 23},
    {'word': 'Lucid', 'value': 22},
    {'word': 'Naver', 'value': 20},
    {'word': 'Kakao', 'value': 18},
    {'word': 'NC Soft', 'value': 18},
    {'word': 'LG', 'value': 16},
    {'word': 'Hyundai', 'value': 16},
    {'word': 'KIA', 'value': 16},
    {'word': 'twitter', 'value': 16},
    {'word': 'Tencent', 'value': 15},
    {'word': 'Alibaba', 'value': 15},
    {'word': 'Disney', 'value': 14},
    {'word': 'Spotify', 'value': 14},
    {'word': 'Udemy', 'value': 13},
    {'word': 'Quizlet', 'value': 13},
    {'word': 'Visa', 'value': 12},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          color: Color.fromARGB(255, 174, 183, 235),
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
  final List<Map> wordlist;
  _paint({
    required this.wordlist,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // drawText();
    // realDrawText();
    WordCloud myWC = WordCloud(mapX: 500, mapY: 500, data: wordlist);
    myWC.drawText();
    List a = myWC.getWordPoint();
    for (var i = 0; i < myWC.getDataLength(); i++) {
      myWC.getTextPainter()[i].paint(canvas, Offset(a[i][0], a[i][1]));
    }

    // Paint paint = Paint()
    //   ..strokeWidth = 3
    //   ..style = PaintingStyle.stroke
    //   ..color = Colors.black;

    // Path path = Path()
    //   ..moveTo(50, 50)
    //   ..lineTo(100, 100);

    // for (var i = 0; i < wordlist.length; i++) {
    //   final textSpan = TextSpan(
    //     text: wordlist[i]['word'],
    //     style: TextStyle(color: Colors.black, fontSize: wordlist[i]['value']),
    //   );

    //   final textPainter = TextPainter()
    //     ..text = textSpan
    //     ..textDirection = TextDirection.ltr
    //     ..textAlign = TextAlign.center
    //     ..layout();

    //   double startX = 0;
    //   double startY = 0;
    //   Offset startOffset = Offset(startX, startY);

    //   final xCenter = (100 - textPainter.width / 2);
    //   final yCenter = (100 - textPainter.height / 2);
    //   final offset = Offset(xCenter, yCenter);

    //   //textPainter.paint(canvas, Offset(textPainter.width, textPainter.height));
    //   //textPainter.paint(canvas, offset);
    //   textPainter.paint(canvas, startOffset);
    // }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
