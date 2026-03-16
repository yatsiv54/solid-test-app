import 'package:flutter/material.dart';
import 'package:test_solid/features/color_changing/doamin/entities/color_circle_entity.dart';

class PositionedCircle extends StatefulWidget {
  final ColorCircleEntity entity;
  const PositionedCircle({super.key, required this.entity});

  @override
  State<PositionedCircle> createState() => _PositionedCircleState();
}

class _PositionedCircleState extends State<PositionedCircle> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: widget.entity.key,
      left: widget.entity.offset.dx,
      top: widget.entity.offset.dy,
      child: AnimatedScale(
        scale: widget.entity.scale,
        duration: const Duration(milliseconds: 700),
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: widget.entity.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
