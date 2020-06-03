import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:FlameGame/box_game.dart';
import 'package:flutter/gestures.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  BoxGame game = BoxGame();
  TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();
  tapGestureRecognizer.onTapDown = game.onTapDown;
  runApp(game.widget);

  flameUtil.addGestureRecognizer(tapGestureRecognizer);
}