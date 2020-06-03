import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class BoxGame extends Game {
  Size screenSize;

  bool clicked = false;

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff3D04AE);
    canvas.drawRect(bgRect, bgPaint);

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(
      screenCenterX - 75,
      screenCenterY - 75,
      150,
      150
    );

    Paint boxPaint = Paint();
    if (clicked) {
      boxPaint.color = Color(Colors.amber.value);
    } else {
      boxPaint.color = Color(Colors.white.value);
    }
    canvas.drawRect(boxRect, boxPaint);
  }

  void update(double t) {}

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;

    developer.log('onTap position: $screenSize $screenSize.height' );
    
    if (d.globalPosition.dx >= screenCenterX - 75
      && d.globalPosition.dx <= screenCenterX + 75
      && d.globalPosition.dy >= screenCenterY - 75
      && d.globalPosition.dy <= screenCenterY + 75
    ) {
      clicked = true;
    }

    if (clicked) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        developer.log('Delay');
        clicked = false;
      });
    }
  }
}