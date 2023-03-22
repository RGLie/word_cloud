import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_cloud/word_cloud_data.dart';
import 'package:word_cloud/word_cloud_setting.dart';
import 'package:word_cloud/word_cloud_shape.dart';

class WordCloudTapView extends StatelessWidget {
  final WordCloudData data;
  final Color? mapcolor;
  final Decoration? decoration;
  final double mapwidth;
  final String? fontFamily;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final double mapheight;
  final List<Color>? colorlist;
  final int attempt;
  final double mintextsize;
  final double maxtextsize;
  final bool optimized;
  final WordCloudShape? shape;
  final Map<String, Function> wordtap;

  WordCloudTapView({
    super.key,
    required this.data,
    required this.mapwidth,
    required this.mapheight,
    required this.wordtap,
    this.mintextsize = 10,
    this.maxtextsize = 100,
    this.attempt = 20,
    this.optimized = false,
    this.shape,
    this.fontFamily,
    this.fontStyle,
    this.fontWeight,
    this.mapcolor,
    this.decoration,
    this.colorlist,
  });
  @override
  Widget build(BuildContext context) {
    WordCloudShape wcshape;
    if (shape == null) {
      wcshape = WordCloudShape();
    } else {
      wcshape = shape!;
    }

    WordCloudSetting wordcloudsetting = WordCloudSetting(
      data: data.getData(),
      minTextSize: mintextsize,
      maxTextSize: maxtextsize,
      attempt: attempt,
      shape: wcshape,
    );

    wordcloudsetting.setMapSize(mapwidth, mapheight);
    wordcloudsetting.setFont(fontFamily, fontStyle, fontWeight);
    wordcloudsetting.setColorList(colorlist);
    wordcloudsetting.setInitial();
    if (optimized) {
      wordcloudsetting.drawTextOptimized();
    } else {
      wordcloudsetting.drawText();
    }

    return GestureDetector(
      onVerticalDragDown: (details) {},
      child: Container(
        width: mapwidth,
        height: mapheight,
        color: mapcolor,
        decoration: decoration,
        child: CustomPaint(
          painter: _paint(wordcloudpaint: wordcloudsetting),
        ),
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
