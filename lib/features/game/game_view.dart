import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tutero_assignment/controller/game_controller.dart';
import 'package:tutero_assignment/core/constant/app_colors.dart';
import 'package:tutero_assignment/core/utils/app_extension.dart';
import 'package:tutero_assignment/core/utils/box_decoration.dart';
import 'package:tutero_assignment/features/game/game_over_view.dart';
import 'package:tutero_assignment/widgets/bullet_widget.dart';
import 'package:tutero_assignment/widgets/particles_widget.dart';
import 'package:tutero_assignment/widgets/player_cursor.dart';

class GameView extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;

  const GameView({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView>
    with SingleTickerProviderStateMixin {
  late GameController gameController;

  late Ticker _ticker;
  StreamSubscription<GameState>? streamSub;

  @override
  void initState() {
    super.initState();
    gameController = GameController(
      screenHeight: widget.screenHeight,
      screenWidth: widget.screenWidth,
    );

    startLoop();
  }

  startLoop() {
    _ticker = createTicker((elapsed) {
      gameController.updateParticles(elapsed);
      gameController.updateBullet();
      setState(() {});
    });

    _ticker.start();
  }

  //Since game is updated every time no need for state builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appDark,
      body: Builder(
        builder: (context) {
          GameState state = gameController.state;
          GameStateType type = state.gameStateType;

          switch (type) {
            case GameStateType.initial:
              return _InitialStart(
                state: state,
                onStart: () {
                  if (state.gameStateType == GameStateType.initial) {
                    gameController.startGame();
                  }
                },
              );

            case GameStateType.playing:
              return _GamePlay(
                key: const ValueKey('game_play'),
                gameController: gameController,
              );

            case GameStateType.paused:
              return Container();

            case GameStateType.end:
              return GameOverDialog(
                state: state,
                onTapRestart: () {
                  gameController = GameController(
                    screenWidth: widget.screenWidth,
                    screenHeight: widget.screenHeight,
                  );
                },
              );

            default:
              return Container();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _ticker.stop();
    _ticker.dispose();
    super.dispose();
  }
}

class _InitialStart extends StatelessWidget {
  const _InitialStart({
    Key? key,
    required this.state,
    required this.onStart,
  }) : super(key: key);

  final GameState state;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            state.message,
            style: context.textTheme.bodyMedium,
          ),
          MouseRegion(
            onEnter: (event) {
              onStart();
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: AppDecoration.lightBorder(
                radius: 50,
                borderColor: Colors.white,
                borderWidth: 2.0,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _GamePlay extends StatelessWidget {
  const _GamePlay({
    Key? key,
    required this.gameController,
  }) : super(key: key);

  final GameController gameController;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        gameController.releaseBullet();
      },
      onPointerMove: (event) {
        gameController.updatePlayer(event.position, event.delta);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.none,
        onHover: (event) {
          // log('${event.delta.dx} : ${event.delta.dy} : ${event.orientation}');
          gameController.updatePlayer(event.position, event.delta);
        },
        child: Stack(
          children: [
            for (var bulletData in gameController.bulletList)
              BulletWidget(bulletData: bulletData),
            PlayerCursor(
              player: gameController.player,
            ),
            for (var particleData in gameController.particleList)
              ParticleWidget(particleData: particleData),
          ],
        ),
      ),
    );
  }
}
