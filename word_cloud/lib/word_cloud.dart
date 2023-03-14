import 'dart:math';

import 'package:flutter/material.dart';

class WordCloud extends StatefulWidget {
  const WordCloud({super.key});

  @override
  State<WordCloud> createState() => _WordCloudState();
}

class _WordCloudState extends State<WordCloud> {
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
          width: 400,
          height: 400,
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
    double mapX = 400;
    double mapY = 400;
    double startPointX = 0;
    double startPointY = 0;
    double endPointX = 0;
    double endPointY = 0;
    List<dynamic> textlist = [];

    List map = [[]];

    for (var i = 0; i < mapX; i++) {
      for (var j = 0; j < mapY; j++) {
        map[i].add(0);
      }
      map.add([]);
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

    int textIndex = 0;
    List addedText = [];

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
      addedText.add(0);
    }

    //textlist.shuffle();

    bool checkMap(
        double sX, double sY, double eX, double eY, double w, double h) {
      if (eX - sX < w) {
        return false;
      }
      if (eY - sY < h) {
        return false;
      }
      for (int i = sX.toInt(); i < sX.toInt() + w; i++) {
        for (int j = sY.toInt(); j < sY.toInt() + h; j++) {
          if (map[i][j] == 1) {
            return false;
          }
        }
      }
      return true;
    }

    void insertTextPaint(int idx, double x, double y) {
      textlist[idx].paint(canvas, Offset(x, y));

      for (int i = x.toInt(); i < x.toInt() + textlist[idx].width; i++) {
        for (int j = y.toInt(); j < y.toInt() + textlist[idx].height; j++) {
          map[i][j] = 1;
        }
      }
    }

    void insertTextPaintVerical(int idx, double x, double y) {
      canvas.save();
      canvas.translate((x), (y));
      canvas.rotate(pi / 2);
      canvas.translate(-(x), -(y));
      textlist[idx].paint(canvas, Offset(x, y - textlist[idx].height));
      canvas.restore();

      for (int i = x.toInt(); i < x.toInt() + textlist[idx].height; i++) {
        for (int j = y.toInt(); j < y.toInt() + textlist[idx].width; j++) {
          map[i][j] = 1;
        }
      }
    }

    int getTextIndex() {
      for (var i = 0; i < addedText.length; i++) {
        if (addedText[i] == 0) {
          return i;
        }
      }
      return addedText.length;
    }

    void addText(double sx, double sy, double ex, double ey) {
      print(textlist.length);
      int tidx = getTextIndex();
      if (textlist.length > tidx) {
        if (checkMap(
            sx, sy, ex, ey, textlist[tidx].width, textlist[tidx].height)) {
          insertTextPaint(tidx, sx, sy);
          int w = textlist[tidx].width;
          int h = textlist[tidx].height;
          addedText[tidx] = 1;
          addText(sx + w, sy, ex, ey);
          addText(sx, sy + h, ex, ey);
          addText(sx + w, 0, ex, ey);
          addText(0, sy + h, ex, ey);
        }
        // if (checkMap(sx, sy, ex, ey, textlist[textIndex].height,
        //     textlist[textIndex].width)) {
        //   insertTextPaintVerical(textIndex, sx, sy);
        //   int h = textlist[textIndex].width;
        //   int w = textlist[textIndex].height;
        //   textIndex += 1;
        //   addText(sx + w, sy, ex, ey);
        //   addText(sx, sy + h, ex, ey);
        //   addText(sx + w, 0, ex, ey);
        //   addText(0, sy + h, ex, ey);
        // }
      }
    }

    // canvas.save();
    // canvas.translate(textCentre.dx, textCentre.dy);
    // canvas.rotate(theta);
    // canvas.translate(-textCentre.dx, -textCentre.dy);
    // textPainter.paint(canvas, delta);
    // canvas.restore();

    //canvas.drawPath(path, paint);

    addText(0, 0, mapX, mapY);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
