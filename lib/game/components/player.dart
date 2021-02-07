import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game/game/collision/collision_box.dart';

enum PlayerStatus { dead, ducking, jumping, running, waiting, intro, dodging }

class Player extends PositionComponent with Resizable {
  Player(Image spriteImage)
      : playerRunning = PlayerRunning(spriteImage),
        playerIdle = PlayerWaiting(spriteImage),
        playerJumping = PlayerJumping(spriteImage),
        playerDead = PlayerDead(spriteImage),
        super();

  bool isIdle = true;

  PlayerStatus _status = PlayerStatus.waiting;

  PlayerStatus get status => _status;
  set status(PlayerStatus status) {
    _status = status;
    actualPlayer.x = x;
    actualPlayer.y = y;
  }

  PlayerWaiting playerIdle;
  PlayerRunning playerRunning;
  PlayerJumping playerJumping;
  PlayerDead playerDead;

  double jumpVelocity = 0.0;
  bool reachedMinHeight = false;
  int jumpCount = 0;
  bool hasPlayedIntro = false;

  PositionComponent get actualPlayer {
    switch (status) {
      case PlayerStatus.waiting:
        return playerIdle;
      case PlayerStatus.jumping:
        return playerJumping;
      case PlayerStatus.dead:
        return playerDead;
      case PlayerStatus.intro:
      case PlayerStatus.running:
      default:
        return playerRunning;
    }
  }

  void startJump(double speed) {
    if (status == PlayerStatus.jumping || status == PlayerStatus.ducking) {
      return;
    }

    status = PlayerStatus.jumping;
    jumpVelocity = PlayerConfig.initialJumpVelocity - (speed / 10);

    reachedMinHeight = false;
  }

  @override
  void render(Canvas c) {
    if (size == null) {
      return;
    }
    actualPlayer.render(c);
  }

  void reset() {
    actualPlayer.y = groundYPos;
    jumpVelocity = 0.0;
    jumpCount = 0;
    status = PlayerStatus.running;
  }

  @override
  void update(double t) {
    if (status == PlayerStatus.jumping) {
      y += jumpVelocity;
      jumpVelocity += PlayerConfig.gravity;
      if (y > groundYPos) {
        reset();
        jumpCount++;
      }
    } else {
      y = groundYPos;
    }

    if (jumpCount == 1 && !playingIntro && !hasPlayedIntro) {
      status = PlayerStatus.intro;
    }
    if (playingIntro && x < PlayerConfig.startXPos) {
      x += (PlayerConfig.startXPos / PlayerConfig.introDuration) * t * 5000;
    }

    actualPlayer.x = x;
    actualPlayer.y = y;
    actualPlayer.update(t);
    super.update(t);
  }

  @override
  void resize(Size size) {
    super.resize(size);
    actualPlayer.y = groundYPos;
  }

  double get groundYPos {
    if (size == null) {
      return null;
    }
    return (size.height / 2) - PlayerConfig.height / 2;
  }

  bool get playingIntro => status == PlayerStatus.intro;

  bool get ducking => status == PlayerStatus.ducking;
}

class PlayerRunning extends AnimationComponent {
  PlayerRunning(Image spriteImage)
      : super(
          88.0,
          90.0,
          Animation.spriteList(
            [
              Sprite.fromImage(
                spriteImage,
                width: PlayerConfig.width,
                height: PlayerConfig.height,
                y: 4.0,
                x: 1514.0,
              ),
              Sprite.fromImage(
                spriteImage,
                width: PlayerConfig.width,
                height: PlayerConfig.height,
                y: 4.0,
                x: 1602.0,
              ),
            ],
            stepTime: 0.2,
          ),
        );
}

class PlayerWaiting extends SpriteComponent {
  PlayerWaiting(Image spriteImage)
      : super.fromSprite(
          PlayerConfig.width,
          PlayerConfig.height,
          Sprite.fromImage(
            spriteImage,
            width: PlayerConfig.width,
            height: PlayerConfig.height,
            x: 76.0,
            y: 6.0,
          ),
        );
}

class PlayerJumping extends SpriteComponent {
  PlayerJumping(Image spriteImage)
      : super.fromSprite(
          PlayerConfig.width,
          PlayerConfig.height,
          Sprite.fromImage(
            spriteImage,
            width: PlayerConfig.width,
            height: PlayerConfig.height,
            x: 1339.0,
            y: 6.0,
          ),
        );
}

class PlayerDead extends SpriteComponent {
  PlayerDead(Image spriteImage)
      : super.fromSprite(
          PlayerConfig.width,
          PlayerConfig.height,
          Sprite.fromImage(
            spriteImage,
            width: PlayerConfig.width,
            height: PlayerConfig.height,
            x: 1782.0,
            y: 6.0,
          ),
        );
}

class PlayerConfig {
  static double gravity = 1;
  static double height = 90.0;
  static double heightDuck = 50.0;
  static double initialJumpVelocity = -15.0;
  static double introDuration = 1500.0;
  static double maxJumpHeight = 30.0;
  static double minJumpHeight = 30.0;
  static double speedDropCoefficient = 3.0;
  static double startXPos = 50.0;
  static double width = 88.0;
  static double widthDuck = 118.0;
}

class PlayerCollisionBoxes {
  static final List<CollisionBox> ducking = <CollisionBox>[
    const CollisionBox(
      x: 1.0,
      y: 18.0,
      width: 110.0,
      height: 50.0,
    ),
  ];

  static final List<CollisionBox> running = <CollisionBox>[
    const CollisionBox(x: 22.0, y: 0.0, width: 34.0, height: 32.0),
    const CollisionBox(x: 1.0, y: 18.0, width: 60.0, height: 18.0),
    const CollisionBox(x: 10.0, y: 35.0, width: 28.0, height: 16.0),
    const CollisionBox(x: 1.0, y: 24.0, width: 58.0, height: 10.0),
    const CollisionBox(x: 5.0, y: 30.0, width: 42.0, height: 8.0),
    const CollisionBox(x: 9.0, y: 34.0, width: 30.0, height: 8.0)
  ];
}
