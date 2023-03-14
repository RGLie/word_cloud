import 'dart:math';

import 'package:flutter/material.dart';

class ThirdWordCloud extends StatefulWidget {
  const ThirdWordCloud({super.key});

  @override
  State<ThirdWordCloud> createState() => _ThirdWordCloudState();
}

class _ThirdWordCloudState extends State<ThirdWordCloud> {
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
    int distance = 10;
    double startPointX = 0;
    double startPointY = 0;
    double endPointX = 0;
    double endPointY = 0;
    List<dynamic> textlist = [];
    double centerX = mapX / 2;
    double centerY = mapY / 2;
    List map = [[]];

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

    double centerCorrectionX = centerX - textlist[0].width / 2;
    double centerCorrectionY = centerY - textlist[0].height / 2;

    for (var i = 0; i < mapX; i++) {
      for (var j = 0; j < mapY; j++) {
        if (pow(i - 250, 2) + pow(j - 250, 2) > pow(250, 2)) {
          map[i].add(1);
        } else {
          map[i].add(0);
        }
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

    void drawPoint(int index) {
      double w = textlist[index].width;
      double h = textlist[index].height;
      List<dynamic> queue = [];
      int idx = 0;

      List visitMap = [[]];

      for (var i = 0; i < mapX; i++) {
        for (var j = 0; j < mapY; j++) {
          visitMap[i].add(0);
        }
        visitMap.add([]);
      }

      queue.add([centerCorrectionX.toInt(), centerCorrectionY.toInt()]);
      //print(centerCorrectionY);

      while (queue.length > idx) {
        //print('${queue.length}   ${idx}');
        if (visitMap[queue[idx][0]][queue[idx][1]] == 0) {
          visitMap[queue[idx][0]][queue[idx][1]] = 1;
          if (checkMap(queue[idx][0], queue[idx][1], w, h)) {
            textlist[index].paint(canvas, Offset(queue[idx][0], queue[idx][1]));

            for (int i = queue[idx][0].toInt();
                i < queue[idx][0].toInt() + w;
                i++) {
              for (int j = queue[idx][1].toInt();
                  j < queue[idx][1].toInt() + h;
                  j++) {
                map[i][j] = 1;
                //visitMap[i][j] = 1;
              }
            }
            break;
          } else {
            
            switch ((idx/3).floor()%4) {
              case 0:
                if (queue[idx][1] + distance < mapY) {
                  queue.add([queue[idx][0], queue[idx][1] + distance]);
                }
                if (queue[idx][0] + distance < mapX) {
                  queue.add([queue[idx][0] + distance, queue[idx][1]]);
                }
                
                if (queue[idx][0] - distance > 0) {
                  queue.add([queue[idx][0] - distance, queue[idx][1]]);
                }
                if (queue[idx][1] - distance > 0) {
                  queue.add([queue[idx][0], queue[idx][1] - distance]);
                }
                break;
              case 1:
                if (queue[idx][0] - distance > 0) {
                  queue.add([queue[idx][0] - distance, queue[idx][1]]);
                }
                if (queue[idx][1] + distance < mapY) {
                  queue.add([queue[idx][0], queue[idx][1] + distance]);
                }
                
                if (queue[idx][1] - distance > 0) {
                  queue.add([queue[idx][0], queue[idx][1] - distance]);
                }
                if (queue[idx][0] + distance < mapX) {
                  queue.add([queue[idx][0] + distance, queue[idx][1]]);
                }
                break;
              case 2:
                if (queue[idx][1] - distance > 0) {
                  queue.add([queue[idx][0], queue[idx][1] - distance]);
                }
                if (queue[idx][0] - distance > 0) {
                  queue.add([queue[idx][0] - distance, queue[idx][1]]);
                }
                
                if (queue[idx][0] + distance < mapX) {
                  queue.add([queue[idx][0] + distance, queue[idx][1]]);
                }
                if (queue[idx][1] + distance < mapY) {
                  queue.add([queue[idx][0], queue[idx][1] + distance]);
                }
                break;
              case 3:
                if (queue[idx][0] + distance < mapX) {
                  queue.add([queue[idx][0] + distance, queue[idx][1]]);
                }
                if (queue[idx][1] - distance > 0) {
                  queue.add([queue[idx][0], queue[idx][1] - distance]);
                }
                
                if (queue[idx][1] + distance < mapY) {
                  queue.add([queue[idx][0], queue[idx][1] + distance]);
                }
                if (queue[idx][0] - distance > 0) {
                  queue.add([queue[idx][0] - distance, queue[idx][1]]);
                }
                break;
            }
          }
        }
        idx += 1;
      }
    }

    //textlist.shuffle();

    for (var i = 0; i < textlist.length; i++) {
      drawPoint(i);
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
