import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_solid/features/color_changing/doamin/entities/new_color_entity.dart';

class ColorEngine {
  static NewColor generateRandomColor() {
    final a = Random().nextInt(255);
    final b = Random().nextInt(255);
    final c = Random().nextInt(255);

    return NewColor(
      color: Color.fromARGB(255, a, b, c),
      colorString: '255,$a,$b,$c',
    );
  }
}
