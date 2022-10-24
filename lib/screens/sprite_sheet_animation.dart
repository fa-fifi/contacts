import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';

class SpriteSheetAnimation extends FlameGame {
  late SpriteAnimationComponent spriteAnimationComponent;

  @override
  Color backgroundColor() => const Color(0x00000000);

  @override
  Future<void>? onLoad() async {
    Image image = await images.load('animation.png');
    SpriteAnimation animation = SpriteAnimation.fromFrameData(
        image,
        SpriteAnimationData.sequenced(
            amount: 35,
            stepTime: 0.1,
            textureSize: Vector2(170, 171),
            amountPerRow: 12));
    spriteAnimationComponent = SpriteAnimationComponent()
      ..animation = animation
      ..size = Vector2(170.67, 171) * 0.5
      ..position = Vector2(-30, -30);
    add(spriteAnimationComponent);
    return super.onLoad();
  }
}
