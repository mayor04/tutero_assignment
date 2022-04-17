import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:tutero_assignment/core/state_listener/state_listener.dart';
import 'package:tutero_assignment/models/bullet.dart';
import 'package:tutero_assignment/models/particle/circle_particle.dart';
import 'package:tutero_assignment/models/particle/particle_data.dart';
import 'package:tutero_assignment/models/player.dart';
import 'package:tutero_assignment/models/vector2.dart';

class GameController extends StateListener<GameState> {
  final Random _random = Random();

  late Player player;

  final double particleCount = 15;
  final List<ParticleData> particleList = [];
  final List<BulletData> bulletList = [];

  late Size screenSize;
  final Vect2 velocity = Vect2(1, 1);

  GameController({
    required double screenWidth,
    required double screenHeight,
  }) : super(
          GameState(
            message: 'Place mouse at the center to start',
            gameStateType: GameStateType.initial,
            startTime: DateTime.now().millisecondsSinceEpoch,
          ),
        ) {
    screenSize = Size(screenWidth, screenHeight);
  }

  void startGame() {
    player = Player(0, 0);
    generateRandomParicles();

    addState(
      GameState(
        message: '',
        gameStateType: GameStateType.playing,
        startTime: state.startTime,
        endTime: null,
      ),
    );
  }

  void updatePlayer(Offset mousePosition, Offset deltaPosition) {
    player.updatePosition(mousePosition, deltaPosition);
  }

  void releaseBullet() {
    var bulletData = BulletData(
      player.centerPosition,
      player.angleOffset.normScale(1),
    );

    bulletList.add(bulletData);
  }

  void updateParticles(Duration elapsedTime) {
    if (state.gameStateType != GameStateType.playing) {
      return;
    }

    for (var particleData in [...particleList]) {
      checkCollision(
        particleData,
        otherPos: player.centerPosition,
        otherRadius: player.width / 2,
        isPlayer: true,
      );

      for (var bulletData in bulletList) {
        checkCollision(
          particleData,
          otherPos: bulletData.position,
          otherRadius: 5,
          isPlayer: false,
        );
      }

      moveParticles(particleData, elapsedTime);
    }

    while (particleList.length < 15) {
      addParticle();
    }
  }

  void updateBullet() {
    for (var bulletData in bulletList) {
      bulletData.updatePosition();
    }
  }

  void checkCollision(
    ParticleData particleData, {
    required Vect2 otherPos,
    required double otherRadius,
    required bool isPlayer,
  }) {
    if (isPlayer && particleData.isColliding(otherPos, otherRadius)) {
      addState(
        GameState(
          message: 'Game Over, Better Luck Next Time',
          gameStateType: GameStateType.end,
          startTime: state.startTime,
          endTime: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    } else if (particleData.isColliding(otherPos, otherRadius)) {
      particleList.remove(particleData);
    }
  }

  void moveParticles(ParticleData particleData, Duration elapsedTime) {
    double xDirection = _random.nextInt(2) == 0 ? 1 : -1;
    double yDirection = _random.nextInt(2) == 0 ? 1 : -1;

    if (particleData.position.x < -50 ||
        particleData.position.x > screenSize.width + 50) {
      xDirection = -1;
    }

    if (particleData.position.y < -50 ||
        particleData.position.y > screenSize.height + 50) {
      yDirection = -1;
    }

    particleData.moveParticle(
      elapsedTime,
      unit: Vect2(xDirection, yDirection),
    );
  }

  void generateRandomParicles() {
    for (var i = 0; i < particleCount; i++) {
      addParticle();
    }
  }

  addParticle() {
    var randomSize = _random.nextDouble() * 50 + 30;
    var randomPositon = Vect2(0, 0)
      ..x = _random.nextDouble() * screenSize.width
      ..y = _random.nextDouble() * screenSize.height;

    particleList.add(
      CircleParticleData(
        size: Vect2(randomSize, randomSize),
        position: randomPositon,
        velocity: velocity.copy(),
        directionChangeTime: _random.nextInt(20) + 5,
      ),
    );
  }
}

enum GameStateType { initial, paused, end, playing }

class GameState {
  final String message;
  final GameStateType gameStateType;
  final int? startTime;
  final int? endTime;

  GameState({
    required this.message,
    required this.gameStateType,
    required this.startTime,
    this.endTime,
  });
}
