import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud.dart';

class WordCloudView extends StatelessWidget {
  final WordCloud wordcloud;
  final Color? mapcolor;
  final Decoration? decoration;
  final double mapwidth;
  final double mapheight;

  WordCloudView({
    super.key,
    required this.wordcloud,
    required this.mapwidth,
    required this.mapheight,
    this.mapcolor,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    wordcloud.setMapSize(mapwidth, mapheight);
    wordcloud.setInitial();
    wordcloud.drawText();

    return Container(
      width: 500,
      height: 500,
      color: mapcolor,
      decoration: decoration,
      child: CustomPaint(
        painter: _paint(wordcloudpaint: wordcloud),
      ),
    );
  }
}

class _paint extends CustomPainter {
  final WordCloud wordcloudpaint;
  _paint({
    required this.wordcloudpaint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < wordcloudpaint.getDataLength(); i++) {
      wordcloudpaint.getTextPainter()[i].paint(
          canvas,
          Offset(wordcloudpaint.getWordPoint()[i][0],
              wordcloudpaint.getWordPoint()[i][1]));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
