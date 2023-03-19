import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud_data.dart';
import 'package:word_cloud/word_cloud_setting.dart';

class WordCloudView extends StatelessWidget {
  final WordCloudData data;
  final Color? mapcolor;
  final Decoration? decoration;
  final double mapwidth;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final double mapheight;
  final List<Color>? colorlist;
  final double mintextsize;
  final double maxtextsize;

  WordCloudView({
    super.key,
    required this.data,
    required this.mapwidth,
    required this.mapheight,
    this.mintextsize = 10,
    this.maxtextsize = 100,
    this.fontFamily,
    this.fontStyle,
    this.fontWeight,
    this.mapcolor,
    this.decoration,
    this.colorlist,
  });
  @override
  Widget build(BuildContext context) {
    WordCloudSetting wordcloudsetting = WordCloudSetting(
      data: data.getData(),
      minTextSize: mintextsize,
      maxTextSize: maxtextsize,  
    );

    wordcloudsetting.setMapSize(mapwidth, mapheight);
    wordcloudsetting.setFont(fontFamily, fontStyle, fontWeight);
    wordcloudsetting.setColorList(colorlist);
    wordcloudsetting.setInitial();
    wordcloudsetting.drawText();

    return Container(
      width: mapwidth,
      height: mapheight,
      color: mapcolor,
      decoration: decoration,
      child: CustomPaint(
        painter: _paint(wordcloudpaint: wordcloudsetting),
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
