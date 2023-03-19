import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud_setting.dart';

class WordCloudView extends StatelessWidget {
  final WordCloudSetting wordcloud;
  final Color? mapcolor;
  final Decoration? decoration;
  final double mapwidth;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final double mapheight;
  final List<Color>? colorlist;

  WordCloudView({
    super.key,
    required this.wordcloud,
    required this.mapwidth,
    required this.mapheight,
    this.fontFamily,
    this.fontStyle,
    this.fontWeight,
    this.mapcolor,
    this.decoration,
    this.colorlist,
  });

  @override
  Widget build(BuildContext context) {
    wordcloud.setMapSize(mapwidth, mapheight);
    wordcloud.setFont(fontFamily, fontStyle, fontWeight);
    wordcloud.setColorList(colorlist);

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
  final WordCloudSetting wordcloudpaint;
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
