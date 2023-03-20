class WordCloudShape {
  double boundaryStartX = 0;
  double boundaryEndX = 0;
  double boundaryStartY = 0;
  double boundaryEndY = 0;
  String type = 'normal';

  String getType() {
    return type;
  }
}

class WordCloudCircle extends WordCloudShape {
  double radius;

  WordCloudCircle({required this.radius}) {
    type = 'circle';
  }

  double getRadius() {
    return radius;
  }
}
