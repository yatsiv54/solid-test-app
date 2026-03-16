import 'package:flutter/material.dart';
import 'package:test_solid/features/color_changing/doamin/entities/color_circle_entity.dart';
import 'package:test_solid/features/color_changing/doamin/entities/new_color_entity.dart';
import 'package:test_solid/features/color_changing/helpers/color_engine.dart';
import 'package:test_solid/features/color_changing/presentation/widgets/positioned_circle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ColorCircleEntity> colorCircles = [];

  String color = '255,255,255,255';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _changeColor,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ...colorCircles.map((e) => PositionedCircle(entity: e)),
            const Center(
              child: Text('Hello there!', style: TextStyle(fontSize: 32)),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 100,
              child: Column(
                children: [
                  const Text('COLOR:', style: TextStyle(fontSize: 20)),
                  Text(
                    color,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeColor(TapDownDetails details) {
    final NewColor newColor = ColorEngine.generateRandomColor();
    if (colorCircles.length > 50) {
      colorCircles.removeRange(1, 30);
    }
    setState(() {
      color = newColor.colorString;
      colorCircles.add(
        ColorCircleEntity(
          offset: details.localPosition,
          color: newColor.color,
          scale: 0,
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        colorCircles.last.scale = 100;
      });
    });
  }
}
