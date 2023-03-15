import 'dart:math';

import 'package:flutter/material.dart';

class FourthWordCloud extends StatefulWidget {
  const FourthWordCloud({super.key});

  @override
  State<FourthWordCloud> createState() => _FourthWordCloudState();
}

class _FourthWordCloudState extends State<FourthWordCloud> {
  List<dynamic> word_list = [
    {'word': 'Apple', 'value': 65},
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
  final List<dynamic> wordlist;
  _paint({
    required this.wordlist,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double mapX = 500;
    double mapY = 500;
    List<dynamic> textlist = [];
    double centerX = mapX / 2;
    double centerY = mapY / 2;
    List map = [[]];
    List textCenter = [];
    List textPoints = [];

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

      textlist.add(textPainter);
    }

    for (var i = 0; i < textlist.length; i++) {
      double centerCorrectionX = centerX - textlist[i].width / 2;
      double centerCorrectionY = centerY - textlist[i].height / 2;
      textCenter.add([centerCorrectionX, centerCorrectionY]);
      textPoints.add([]);
    }

    for (var i = 0; i < mapX; i++) {
      for (var j = 0; j < mapY; j++) {
        map[i].add(0);
      }
      map.add([]);
    }

    bool checkMap(double x, double y, double w, double h) {
      if (mapX - x < w) {
        return false;
      }
      if (mapY - y < h) {
        return false;
      }
      for (int i = x.toInt(); i < x.toInt() + w; i++) {
        for (int j = y.toInt(); j < y.toInt() + h; j++) {
          if (map[i][j] == 1) {
            return false;
          }
        }
      }
      return true;
    }

    textlist[0].paint(canvas, Offset(textCenter[0][0], textCenter[0][1]));
    for (int i = textCenter[0][0].toInt();
        i < textCenter[0][0].toInt() + textlist[0].width;
        i++) {
      for (int j = textCenter[0][1].toInt();
          j < textCenter[0][1].toInt() + textlist[0].height;
          j++) {
        map[i][j] = 1;
        //visitMap[i][j] = 1;
      }
    }

    void drawIn(int index, double x, double y) {
      //textlist[index].paint(canvas, Offset(x, y));
      textPoints[index] = [x, y];
      for (int i = x.toInt(); i < x.toInt() + textlist[index].width; i++) {
        for (int j = y.toInt(); j < y.toInt() + textlist[index].height; j++) {
          map[i][j] = 1;
          //visitMap[i][j] = 1;
        }
      }
    }

    drawIn(0, textCenter[0][0], textCenter[0][1]);

    void drawText() {
      for (var i = 1; i < textlist.length; i++) {
        double w = textlist[i].width;
        double h = textlist[i].height;
        int attempts = 0;

        bool isadded = false;

        while (!isadded) {
          int getX = Random().nextInt(mapX.toInt() - w.toInt());
          int direction = Random().nextInt(2);
          if (direction == 0) {
            for (int y = textCenter[i][1].toInt(); y > 0; y--) {
              if (checkMap(getX.toDouble(), y.toDouble(), w, h)) {
                drawIn(i, getX.toDouble(), y.toDouble());
                isadded = true;
                break;
              }
            }
          } else if (direction == 1) {
            for (int y = textCenter[i][1].toInt(); y < mapY; y++) {
              if (checkMap(getX.toDouble(), y.toDouble(), w, h)) {
                drawIn(i, getX.toDouble(), y.toDouble());
                isadded = true;
                break;
              }
            }
          }
          attempts += 1;
          if (attempts > 100) {
            isadded = true;
          }
        }
      }
    }

    void realDrawText() {
      for (var i = 0; i < textPoints.length; i++) {
        textlist[i].paint(canvas, Offset(textPoints[i][0], textPoints[i][1]));
      }
    }

    drawText();
    realDrawText();

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
