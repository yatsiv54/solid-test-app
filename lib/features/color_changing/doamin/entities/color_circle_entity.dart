import 'package:flutter/material.dart';

class ColorCircleEntity {
  final Offset offset;
  final Color color;
  double scale;
  final Key key;

  ColorCircleEntity({
    required this.offset,
    required this.color,
    required this.scale,
  }) : key = UniqueKey();
}
