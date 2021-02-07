import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game/game/components/player_config.dart';

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
    jumpVelocity = TRexConfig.initialJumpVelocity - (speed / 10);

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
      jumpVelocity += TRexConfig.gravity;
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
    if (playingIntro && x < TRexConfig.startXPos) {
      x += (TRexConfig.startXPos / TRexConfig.introDuration) * t * 5000;
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
    return (size.height / 2) - TRexConfig.height / 2;
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
                width: TRexConfig.width,
                height: TRexConfig.height,
                y: 4.0,
                x: 1514.0,
              ),
              Sprite.fromImage(
                spriteImage,
                width: TRexConfig.width,
                height: TRexConfig.height,
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
          TRexConfig.width,
          TRexConfig.height,
          Sprite.fromImage(
            spriteImage,
            width: TRexConfig.width,
            height: TRexConfig.height,
            x: 76.0,
            y: 6.0,
          ),
        );
}

class PlayerJumping extends SpriteComponent {
  PlayerJumping(Image spriteImage)
      : super.fromSprite(
          TRexConfig.width,
          TRexConfig.height,
          Sprite.fromImage(
            spriteImage,
            width: TRexConfig.width,
            height: TRexConfig.height,
            x: 1339.0,
            y: 6.0,
          ),
        );
}

class PlayerDead extends SpriteComponent {
  PlayerDead(Image spriteImage)
      : super.fromSprite(
          TRexConfig.width,
          TRexConfig.height,
          Sprite.fromImage(
            spriteImage,
            width: TRexConfig.width,
            height: TRexConfig.height,
            x: 1782.0,
            y: 6.0,
          ),
        );
}
